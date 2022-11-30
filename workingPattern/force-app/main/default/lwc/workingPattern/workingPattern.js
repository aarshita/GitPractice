import { LightningElement , track} from 'lwc';
import ObjectName from '@salesforce/schema/Working_Pattern__c';
import Countries from '@salesforce/schema/Working_Pattern__c.Country__c';
import DeliveryArea from '@salesforce/schema/Working_Pattern__c.Delivery_Area__c';
import Contrats from '@salesforce/schema/Working_Pattern__c.Contract_Type__c';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class WorkingPattern extends LightningElement {
    @track dayselection;
    value = "";
    val;
    DaySelected = false;

    ObjectApiName = ObjectName;
    CountryName = Countries;
    DeliverAt = DeliveryArea;
    ContractType = Contrats;

    get options(){
        return[
            {label : 'Monday', value:'Monday'},
            {label : 'Tuseday', value:'Tuesday'},
            {label : 'Wednesday', value:'Wednesday'},
            {label : 'Thursday', value:'Thursday'},
            {label : 'Friday', value:'Friday'},
            {label : 'Saturday', value:'Saturday'},
            {label : 'Sunday', value:'Sunday'},
        ];
    }



    ListOfDays = [
        {
            Id: 'Monday',
            Day : 'Monday'
        },
        {
            Id: 'Tuesday',
            Day : 'Tuesday'
        },
        {
            Id: 'Wednesday',
            Day : 'Wednesday'
        },

        {
            Id: 'Thursday',
            Day : 'Thursday'
        },

        {
            Id: 'Friday',
            Day : 'Friday'
        },

        {
            Id: 'Saturday',
            Day : 'Saturday'
        },

        {
            Id: 'Sunday',
            Day : 'Sunday'
        }
    ];

    handleChange(event){
        this.val = event.detail.value;
        console.log('first console '+this.val);
        console.log(this.ListOfDays);
        for(let i=0; i<this.ListOfDays.length; i++){
            if(this.val == this.ListOfDays[i].Id && this.DaySelected== false){
                console.log('second console '+this.ListOfDays[i].Id);
                this.DaySelected = true;
               }else{
                this.DaySelected = false;
               }
            }
        }
     
    }
   
