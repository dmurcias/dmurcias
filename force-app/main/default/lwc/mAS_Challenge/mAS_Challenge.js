/*
    Created by: Daniel Murcia Suarez
    crated Date: 02/03/21
    This component was created to list all related locations by product, 
    and the end-user has the possibility to update the Quantity of products by location.
    version. 1.00
*/
import { LightningElement, wire, track,api } from 'lwc';
// import the apex class to get al realted location by current product.
import getRelLocation from '@salesforce/apex/lwcMASChallengeControler.getRelatedLocation';
// to update the record I used the uiRecordApi reference 
// https://developer.salesforce.com/docs/component-library/documentation/en/lwc/lwc.reference_update_record
import { updateRecord } from 'lightning/uiRecordApi';
// import show toast for show the result of any error o succes message.
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
// Import refreshApex to refresh the table after update any register
import { refreshApex } from '@salesforce/apex';

// datatable columns
const columnsLoc = [
{
    label: 'Location Name',
    fieldName: 'Location',
    type: 'text',
}, {
    label: 'Quantity',
    fieldName: 'Quantity__c',
    type: 'Number',
    editable: true
}
];
export default class InlineEditTable extends LightningElement {

columnsLoc=columnsLoc;
@api recordId;
@track wiredResults = [];
saveDraftValuesLoc = [];
locations = [];
// use wire function to execute the getRelLocation apex class with the recordId as input parameter.
@wire(getRelLocation, {productId:'$recordId' }) locList(result) {
    this.wiredResults = result;
    if (result.data) {
        console.log('data:' + JSON.stringify(result.data));
        let responseArray = [];
        result.data.forEach(element => {
            let objLoc = {};
            objLoc.Id=element.Id;
            objLoc.Location = element.Location__r.Name ;
            objLoc.Quantity__c = element.Quantity__c;
            responseArray.push(objLoc);
        });
        this.locations = responseArray;
    } else if (result.error) {
        //
        this.error = 'Unknown error';
        if (Array.isArray(result.error.body)) {
            this.error = result.error.body.map(e => e.message).join(', ');
        } else if (typeof result.error.body.message === 'string') {
            this.error = result.error.body.message;
        }
        this.locations = undefined;
    }
  }
handleSave(event) {

    console.log('<--------into handleSave method------>');
    this.saveDraftValuesLoc = event.detail.draftValues;
    const recordInputs = this.saveDraftValuesLoc.slice().map(draft => {
        const fields = Object.assign({}, draft);
        console.log('fields:' + JSON.stringify(fields));
        return { fields };
    });

    // Updateing the records using the UiRecordAPi
    const promises = recordInputs.map(recordInput => updateRecord(recordInput));
    Promise.all(promises).then(res => {
        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Success',
                message: 'Records Updated Successfully!!',
                variant: 'success'
            })
        );
        this.saveDraftValuesLoc = [];
        return this.refresh();
    }).catch(error => {
        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Error',
                message: 'An Error Occured!!',
                variant: 'error'
            })
        );
    }).finally(() => {
        this.saveDraftValuesLoc = [];
    });
}

// This function is used to refresh the table once data updated
async refresh() {
    await refreshApex(this.wiredResults);
}
greeting = 'Salesforce LWC';

    handleChange(event) {
        this.greeting = event.target.value;
    }
}