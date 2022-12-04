import { LightningElement, track } from 'lwc';
import getUsersData from '@salesforce/apex/getUsersApex.getUsersData';
export default class GetUsers extends LightningElement {
// hello Rohan Dhanotiya
@track UserData;
picture;
name;
email;
phone;
//JSON.parse(JSON.stringify(result.results[0]));
connectedCallback(){
    getUsersData()
    .then((result) => {
        this.UserData =JSON.parse(JSON.stringify(result.results[0]));
        this.picture = this.UserData.picture.large;
        this.name = this.UserData.name.first+ " "+ this.UserData.name.last;
        this.email = this.UserData.email;
        this.phone = this.UserData.phone;
    }) 
    .catch((error)=>{
        console.log(error);
    })
}

}