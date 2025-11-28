
using { anubhav.db.master, anubhav.db.transaction } from '../db/datamodel';

// using { cappo.cds } from '../db/cdsview';

service CatalogService @(path : 'CatalogService', requirs:'authenticated-user') {

    entity employeeSet  @(restrict : [
        { grant:['READ'], to:'Viwer', where :'bankName = $user.BankName'},
        {grant:['WRITE'], to:'Admin'}])
        as projection on master.employees;

    entity businesspartnerset as projection on master.businesspartner;

    entity addressset as projection on master.address;

    entity productset as projection on master.product;

    entity PO @(odata.draft.enabled:true) as projection on transaction.purchaseorder{
        *,
        Items,
        OVERALL_STATUS @(readonly),
        case OVERALL_STATUS 
        when 'P' then 'Pending'
        when 'R' then 'Reject'
        when 'N' then 'New'
        when 'A' then 'Approved'
        end as OverallStatus : String(10),
        case OVERALL_STATUS
        when 'P' then  1
        when 'N' then  4
        end as Colorcode :String(10),

    }
    actions{
        @Common.SideEffects :{
            TargetProperties : [
                'in/GROSS_AMOUNT',
            ]
        }
action boost() returns PO
    };
  function largestOrder() returns PO;
    entity items as projection on transaction.poitems;

    // entity headerset as projection on cds.CDSViews.POWorklist;

    // entity itemset as projection on cds.CDSViews.ItemView;
    
    // entity products as projection on cds.CDSViews.ProductView;

}