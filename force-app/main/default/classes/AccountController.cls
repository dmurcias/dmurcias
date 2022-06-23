public with sharing class AccountController {
    public AccountController() {
        Map<String, testNoSOQL__mdt> mdtGetAllNoSOQL= testNoSOQL__mdt.getAll();
        System.debug('mdtGetAllNoSOQL : '+mdtGetAllNoSOQL);
        testNoSOQL__mdt mdtGetAllNoSOQLById= testNoSOQL__mdt.getInstance('m002J0000000B3t');
        System.debug('mdtGetAllNoSOQLById : '+mdtGetAllNoSOQLById);
    }
}