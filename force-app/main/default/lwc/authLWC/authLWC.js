import { LightningElement, wire } from 'lwc';
import auth from '@salesforce/apex/OpenOrg.myOrg'
export default class AuthLWC extends LightningElement {
    text;
    
    handleClick(){
        auth()
        .then(result =>{
            this.text = result;
            console.log(this.text);
        })
        .catch(error =>{
            console.log(error);
        })
        window.open(this.text);
    }
}