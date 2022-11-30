import { LightningElement ,  track} from 'lwc';



import AllObjects from '@salesforce/apex/finalSOQLApex.AllObjects';
import getAllFieldss from '@salesforce/apex/finalSOQLApex.getAllFieldss';
import queryRecord from '@salesforce/apex/finalSOQLApex.queryRecord';
export default class FinalSOQL extends LightningElement {

 
    COLUMNS = [
        {label:'Id', fieldName:'Id'},
        {label:'Name', fieldName:'Name'},
     ];
@track ObjectList = [];
error;
ObjectApiName;
@track fields =[];
@track values = [];
ListVal;
FieldQuery;
@track areDetailsVisible = true;
DataVal=[];

    connectedCallback(){
        AllObjects()
        .then(result =>{
            this.ObjectList = result
        }).catch(error =>{
            this.error = error;
        })
}

handleFieldChange(event){
    var SelectedObject = event.target.value;
    this.ObjectApiName = SelectedObject;

    getAllFieldss({obj :  this.ObjectApiName })
    .then(result =>{
        this.fields = result;
        this.value = this.fields;
    }).catch(error =>{
        this.error = error;
    })
}

handleSelectChange(event){
    var selectedFieldValue = event.target.value;
    this.ListVal = selectedFieldValue.toString() + "";
}

genrateFieldQuery(event){
    var objtName = this.ObjectApiName;
    var makeQuery = this.ListVal;
    var querymaker = 'SELECT'+' ' + makeQuery +' '+'From'+ ' ' + objtName;
    this.FieldQuery = querymaker;
}


fetchRecord(event){
this.areDetailsVisible = true;

queryRecord({records :  this.FieldQuery })
.then(result =>{
    this.DataVal = result;
    console.log('Data - '+JSON.stringify(this.DataVal))
  
}).catch(error =>{
    this.error = error;
})

}








}