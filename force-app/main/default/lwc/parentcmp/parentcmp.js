import { LightningElement, track, wire } from 'lwc';
import retrieveAccountRecords from '@salesforce/apex/AccountController.retrieveAccountRecords';
export default class Parentcmp extends LightningElement {
    @track contacts;
    @track accData;
    @track accConMap = {};

    handleClick(event){      
        console.log('insiede handleChangeRadio') ;
        var accountId = event.target.dataset.targetId;
        console.log('accountId:',accountId);
        console.log('contacts:',JSON.stringify(this.accConMap[accountId]));
        this.contacts = this.accConMap[accountId];
    }

    @wire (retrieveAccountRecords) 
      wireConRecord({error,data}){
        if(data){
          this.accData = data; //assigning account data
          //logic to create map of account Id and its associated contacts
          for(var index in data){
            console.log('acc.Id:',data[index].Id);
            console.log('acc.Contacts:',data[index].Contacts);
            this.accConMap[data[index].Id] = data[index].Contacts;
          } 
          console.log('acct data:',data);  
          console.log('accConMap:',JSON.stringify(this.accConMap)); 
          this.errorMsg = undefined;    
        }else{         
          this.errorMsg = error;
          this.accData = undefined;
        }
      }
}