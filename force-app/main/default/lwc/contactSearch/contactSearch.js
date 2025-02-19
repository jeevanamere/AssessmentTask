import { LightningElement, track } from 'lwc';
import getContactList from '@salesforce/apex/ContactSearchController.getContactList';
export default class ContactSearch extends LightningElement {
    @track contacts;
    searchValue = '';

    // update searchValue var when input field value change
    searchKeyword(event) {
        this.searchValue = event.target.value;
    }

    // call apex method on button click 
    handleSearchKeyword() {
        console.log('inside handle search');
        if (this.searchValue !== '') {
            getContactList({
                    searchKey: this.searchValue
                })
                .then(result => {
                    console.log('result::',result);
                    // set @track contacts variable with return contact list from server  
                    this.contacts = result;
                })
                .catch(error => {
                   
                    const event = new ShowToastEvent({
                        title: 'Error',
                        variant: 'error',
                        message: error.body.message,
                    });
                    this.dispatchEvent(event);
                    // reset contacts var with null   
                    this.contacts = null;
                });
        } else {
            // fire toast event if input field is blank
            const event = new ShowToastEvent({
                variant: 'error',
                message: 'Search text missing..',
            });
            this.dispatchEvent(event);
        }
    }
}