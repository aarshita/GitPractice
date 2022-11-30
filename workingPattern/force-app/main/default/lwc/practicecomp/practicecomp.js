import { LightningElement , wire, track, api} from 'lwc';
import tableDataRecords from '@salesforce/apex/tableDataForContractApex.tableDataRecords';
import { getRecord } from 'lightning/uiRecordApi';
export default class Practicecomp extends LightningElement {

    employeeColumns = [
        { label: 'Employee Id', fieldName: 'employeeId' },
        { label: 'First Name', fieldName: 'firstName' },
        { label: 'Last Name', fieldName: 'lastName' },
        { label: 'Phone Number', fieldName: 'employeePhone', type: 'phone' },
        { label: 'Email Address', fieldName: 'employeeEmail', type: 'email' }
    ];

    COLUMNS = [
        {label:'Working Pattren', fieldname:'Name'},
        {label:'Monday', fieldname:'Monday__c'},
        {label:'Tuesday', fieldname:'Tuesday__c'},
        {label:'Wednesday', fieldname:'Wednesday__c'},
        {label:'Thursday', fieldname:'Thursday__c'},
        {label:'Friday', fieldname:'Friday__c'},
        {label:'Saturday', fieldname:'Saturday__c'},
        {label:'Sunday', fieldname:'Sunday__c'},
        {label:'Day Off', fieldname:'Off_Day__c'} 
     
    
    ];

    employeeData = [
        {
            Id: '1',
            Name: 'My Name',
            Monday__c: 'Richard',
            Tuesday__c: 'Hendricks',
            Wednesday__c: '(158) 389-2794',
            Thursday__c: 'richard@piedpiper.com',
            Friday__c : 'Friday',
            Saturday__c :'Saturday',
            Sunday__c :'Sunday',
            Off_Day__c : 'Day Off'

        },
      
    ];

    @track error;
    @track accList = [] ;
    @api recordId;
    @wire(tableDataRecords, {recordId: '$recordId'})
    wiredAccounts({
        error,
        data
    }) {
        if (data) {
            this.accList = data;
            console.log(data);
            console.log('second '+ this.accList);
        } else if (error) {
            console.log('error '+error);
            this.error = error;
        }
    }
}