import { LightningElement, api } from 'lwc';
import auth from '@salesforce/apex/AuthenticationController.authenticateOrg';
 
export default class AuthenticateButton extends LightningElement {
@api recordId;
    url
    result
    error
    @api async invoke() {
        let params ={
            "orgId" : this.recordId
        };
        console.log('Parameter=='+params);
        console.log('Parameter=='+JSON.stringify(params));
 
       
                    await auth(params)
                        .then( (result) => {    
                            this.url = result;
                            console.log('this.url==='+this.url);
                            window.open(this.url);
                            this.error = undefined
                            console.log(this.result );
                           
                        })
                        .catch( (error) => {
                        this.result = undefined;
                        this.error = error;
                        console.log(this.error);
                    })
}
}