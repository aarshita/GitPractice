import { LightningElement } from 'lwc';
import contractObject from '@salesforce/schema/Contract__c';
import Name from '@salesforce/schema/Contract__c.Name';
import country from '@salesforce/schema/Contract__c.Country__c';
import DeliveryArea from '@salesforce/schema/Contract__c.Delivery_Area__c';
import Contract from '@salesforce/schema/Contract__c.Contract_Type__c'
export default class CreateContract extends LightningElement {

    objectapiname = contractObject;
    ContractName = Name;
    CountryName = country;
    DeliverAt = DeliveryArea;
    contractType = Contract;

}