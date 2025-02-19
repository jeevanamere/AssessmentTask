import { LightningElement, track } from 'lwc';
import getOrgNames from '@salesforce/apex/TargetPageController.getOrgNames';
import getTypes from '@salesforce/apex/TargetPageController.getTypes';
import retrieveMetadataTypes from '@salesforce/apex/TargetPageController.retrieveMetadataTypes';
 
export default class TargetPageComponent extends LightningElement {
    @track selectedOrgName;
    @track selectedType;
    @track OrgNameOptions = [];
    @track typeOptions = [];
    @track metadataTypes;
 
    connectedCallback() {
        // Fetch domain URLs and info options when component initializes
        this.fetchOrgNames();
        this.fetchTypes();
    }
 
    fetchOrgNames() {
        getOrgNames()
            .then(result => {
                this.OrgNameOptions = result;
            })
            .catch(error => {
                console.error('Error fetching domain URLs:', error);
            });
    }
 
    fetchTypes() {
        getTypes()
            .then(result => {
                this.typeOptions = result;
            })
            .catch(error => {
                console.error('Error fetching types:', error);
            });
    }
 
    handleDomainUrlChange(event) {
        this.selectedOrgName = event.detail.value;
    }
 
    handleTypeChange(event) {
        this.selectedType = event.detail.value;
    }
 
    handleSubmit() {
        // Call the Apex method to retrieve metadata types
        retrieveMetadataTypes({ selectedType: this.selectedType, selectedOrgName: this.selectedOrgName })
            .then(result => {
                // Update the metadata types
                this.metadataTypes = result;
                console.log('result'+result);
                console.log(this.metadataTypes);
            })
            .catch(error => {
                console.error('Error retrieving metadata types:', error);
            });
    }
}