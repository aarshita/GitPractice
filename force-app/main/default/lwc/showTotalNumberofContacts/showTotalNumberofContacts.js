import { LightningElement , api, track} from 'lwc';
import showTotalContMethod from '@salesforce/apex/showTotalNumberOfContactsApex.showTotalContMethod';

export default class ShowTotalNumberofContacts extends LightningElement {

@api recordId
@track RecordCount

connectedCallback(){
    showTotalContMethod({RecId  : this.recordId})
    .then((result)=>{
        this.RecordCount = result;
    }).catch((error =>{
        console.log('error '+error);
    }))

}


}