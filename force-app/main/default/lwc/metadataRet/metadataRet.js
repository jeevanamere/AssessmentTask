import { LightningElement, wire, track } from 'lwc';
import { NavigationMixin } from 'lightning/navigation'; // Import NavigationMixin
import getDomainUrls from '@salesforce/apex/TargetPageController.getDomainUrls';
import getMetadataTypes from '@salesforce/apex/TargetPageController.getMetadataTypes';
 

export default class MetadataRet extends LightningElement {
    @track selectedDomainUrl;
    @track selectedMetadataType;
    @track domainUrls = [];
    @track metadataTypes = [];
 
    @wire(getDomainUrls)
    wiredDomainUrls({error, data}) {
        if (data) {
            this.domainUrls = data.map(url => ({ label: url, value: url }));
        } else if (error) {
            console.error('Error fetching domain URLs: ', error);
        }
    }
 
    @wire(getMetadataTypes)
    wiredMetadataTypes({error, data}) {
        if (data) {
            this.metadataTypes = data.map(type => ({ label: type, value: type }));
        } else if (error) {
            console.error('Error fetching metadata types: ', error);
        }
    }
 
    handleDomainUrlChange(event) {
        this.selectedDomainUrl = event.detail.value;
    }
 
    handleMetadataTypeChange(event) {
        this.selectedMetadataType = event.detail.value;
    }

    handleButtonClick() {
        // Define your logic here
        // For example, navigate to a record page
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: 'RECORD_ID', // Replace RECORD_ID with the actual record Id
                actionName: 'view'
            }
        });
    }
}