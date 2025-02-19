// inputParameterExample.js
import { LightningElement, api } from 'lwc';

export default class InputParameterExample extends LightningElement {
    // Define input parameter with @api decorator
    @api inputParameter;
}
