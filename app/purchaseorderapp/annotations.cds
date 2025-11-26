using CatalogService as service from '../../srv/catalogservice';

annotate service.PO with @(

UI.SelectionFields:[
    PO_ID,
    PARTNER_GUID.COMPANY_NAME,
    OVERALL_STATUS,
    GROSS_AMOUNT,
    NET_AMOUNT
],
UI.LineItem:[
    {
        $Type: 'UI.DataField',
        Value: PO_ID,

    },
     {
        $Type:'UI.DataField',
        Value: PARTNER_GUID.COMPANY_NAME,
    },
    {
        $Type: 'UI.DataField',
        Value: OverallStatus,
        Criticality: Colorcode,
    },
    {
        $Type: 'UI.DataField',
        Value: GROSS_AMOUNT,

    },
    {
        $Type: 'UI.DataFieldForAction',
        Action: 'CatalogService.boost',
        Label: 'boost',
        Inline: true
    },
    {
        $Type: 'UI.DataField',
        Value: NET_AMOUNT,
    }
],
UI.HeaderInfo: {
    TypeName: 'PurchaseOrder',
    TypeNamePlural: 'Purchase Orders',
    Title: {Value : PO_ID},
    Description: {Value: PARTNER_GUID.COMPANY_NAME}
},
UI.Facets: [
    {
        $Type: 'UI.CollectionFacet',
        Label: 'General Information',
        Facets: [
            {
              $Type: 'UI.ReferenceFacet',
              Label: 'Order Details',
              Target:'@UI.Identification',
            },
            {
                $Type: 'UI.ReferenceFacet',
                Label: 'Configuration Details',
                Target: '@UI.FieldGroup',
            }
      
        ]
        
    },
          {
                 $Type:'UI.ReferenceFacet',
                 Label: 'PO ITEM',
                 Target: 'Items/@UI.LineItem',
    }
    
],
UI.Identification: [
    {
       $Type: 'UI.DataField',
       Value: PO_ID,
    },
     {
       $Type: 'UI.DataField',
    //    Label: OVERALL_STATUS,
       Value:OVERALL_STATUS,
       Criticality: Colorcode,
    },
    {
       $Type: 'UI.DataField',
       Value: PARTNER_GUID_NODE_KEY,
    },
       {
            
           $Type: 'UI.DataField',
            Value: PARTNER_GUID.COMPANY_NAME,
    }
    

],
UI.FieldGroup:{
    Label:'Pricing',
    Data: [
    {
       $Type: 'UI.DataField',
       Value: GROSS_AMOUNT,
    },
   {
       $Type: 'UI.DataField',
       Value: NET_AMOUNT,
    },
  {
       $Type: 'UI.DataField',
       Value: CURRENCY_code,
    }
    ]
}
);

annotate service.items with @(

    UI.LineItem:[
        {
            
           $Type: 'UI.DataField',
            Value: PO_ITEM_POS,
    },
       {
            
           $Type: 'UI.DataField',
            Value: PRODUCT_GUID_NODE_KEY,
    },
        {
            
           $Type: 'UI.DataField',
            Value: PRODUCT_GUID.DESCRIPTION,
    },
    {
        $Type: 'UI.DataField',
        Value: PRODUCT_GUID.CATEGORY,
    },
       {
            
           $Type: 'UI.DataField',
            Value: GROSS_AMOUNT,
    },
       {
            
           $Type: 'UI.DataField',
            Value: CURRENCY_code,
    }
    
   
        
    ],

    UI.HeaderInfo: {
         TypeName: 'PO Item',
    TypeNamePlural: 'PO Items',
    Title: {Value : PO_ITEM_POS},
    Description: {Value: PRODUCT_GUID_NODE_KEY}
    },
    UI.Facets:[
        {
            $Type: 'UI.CollectionFacet',
            Label: 'Item Details',
            Facets: [
                {
                    $Type: 'UI.ReferenceFacet',
                    Label: 'DETAILS',
                    Target: '@UI.Identification'
                }
                
            ]

        }
    ],
    UI.Identification:[
        {
            $Type: 'UI.DataField',
            Value: PO_ITEM_POS,
        },
         {
            $Type: 'UI.DataField',
            Value: PRODUCT_GUID_NODE_KEY,
        },
           {
            
           $Type: 'UI.DataField',
            Value: PRODUCT_GUID.DESCRIPTION,
    },
         {
            $Type: 'UI.DataField',
            Value: CURRENCY_code,
        },
         {
            $Type: 'UI.DataField',
            Value: GROSS_AMOUNT,
        },
         {
            $Type: 'UI.DataField',
            Value: NET_AMOUNT,
        },
         {
            $Type: 'UI.DataField',
            Value: TAX_AMOUNT,
        }
    ]
) ;

//for value help
annotate service.PO with {
    PARTNER_GUID @(
        Common : { 
            Text : PARTNER_GUID.COMPANY_NAME,
         },
         ValueList.entity: CatalogService.BusinessPartnerSet
    )
};
// for value help
annotate service.items with {
    PRODUCT_GUID @(
        Common : { 
            Text : PRODUCT_GUID.DESCRIPTION,
         },
         ValueList.entity: CatalogService.ProductSet
    )
};

@cds.odata.valuelist
annotate service.businesspartnerset with @(
    UI.Identification:[{
        $Type : 'UI.DataField',
        Value : COMPANY_NAME,
    }]
);

@cds.odata.valuelist
annotate service.productset with @(
    UI.Identification:[{
        $Type : 'UI.DataField',
        Value : DESCRIPTION,
    }]
);




    
