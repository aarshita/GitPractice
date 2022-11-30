import { LightningElement, wire , track, api} from 'lwc';
import tableDataRecords from '@salesforce/apex/tableDataForContractApex.tableDataRecords';
import { getRecord } from 'lightning/uiRecordApi';
import { refreshApex } from '@salesforce/apex';
const COLUMNS = [
    {label:'Ids', fieldname:'id', type:'String'},
    {label:'Working Pattren', fieldname:'Name', type:'text'},
    {label:'Monday', fieldname:'Monday__c', type:'picklist'},
    {label:'Tuesday', fieldname:'Tuesday__c', type:'picklist'},
    {label:'Wednesday', fieldname:'Wednesday__c', type:'picklist'},
    {label:'Thursday', fieldname:'Thursday__c', type:'picklist'},
    {label:'Friday', fieldname:'Friday__c', type:'picklist'},
    {label:'Saturday', fieldname:'Saturday__c', type:'picklist'},
    {label:'Sunday', fieldname:'Sunday__c', type:'picklist'},
    {label:'Day Off', fieldname:'Off_Day__c', type:'picklist'} 
 

];
export default class DataTableForContract extends LightningElement {
    @track data = [];
    columns = COLUMNS;
    error;
    @api recordId
    page;
    dataToRefresh;
    @wire(tableDataRecords, { recordId: '$recordId'})
    WorkingPattrenAlias;
 
     
  //  connectedCallback() {
       // const data = tableDataRecords({ recordId: '$recordId' });
       // this.data = data;




    

 
}