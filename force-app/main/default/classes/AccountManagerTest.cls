@IsTest
global class AccountManagerTest {
    @isTest 
    static void testGetCaseById() {
        Id recordId = createTestRecord();
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://danimurs-dev-ed.salesforce.com/services/apexrest/Accounts/'
            + recordId+'/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        Account thisCase = AccountManager.getAccount();
        System.assert(thisCase != null);
        System.assertEquals('Test Account', thisCase.Name);
    }
    static Id createTestRecord() {
        Account accntTest = new Account(
            Name='Test Account',
            CurrencyIsoCode='COP');
        insert accntTest;
        Contact contactTest = new Contact(
            LastName='Test Cotact',
            AccountId=accntTest.Id);
        insert contactTest;
        return accntTest.Id;
    } 
}