import {createElement} from 'lwc'
import mAS_Challenge from "c/mAS_Challenge";
describe('masChallenge test suite',()=>{
    test('TestFirst',()=>{
        const frstElement = createElement('c-m-a-s_-challenge',{
            is:mAS_Challenge
        })
        document.body.appendChild(frstElement)
        const pElmt = frstElement.shadowRoot.querySelector('p')
        expect(pElmt.textContent).toBe('Hello, Salesforce LWC!')
    })
})