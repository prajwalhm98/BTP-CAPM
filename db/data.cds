
using { ust.reuse as reuse } from './csv/reuse';
using { cuid,  managed, temporal} from '@sap/cds/common';
namespace ust.demo;

context master {

    entity student : reuse.address {
        key id: reuse.Guid;
        name:String(80);
        age:Integer;
        class: Association to semester;
        

    }

    entity semester {
        key id: reuse.Guid;
        name:String(80);
        hod:String(40);
    }
}

context transcation {
    entity subs : cuid, managed, temporal{
          student : Association to one master.student;
          semester : Association to one master.semester;

    }
    
}
