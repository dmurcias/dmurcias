global class MyWebService {
    webService static Account createAccount(string accnt) {
        Account acct = new Account();
        acct.Name = accnt;
        acct.Website='test@gmail.com';
        insert acct;
        return acct;
    }
    
}