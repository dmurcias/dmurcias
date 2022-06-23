/*
    Created by: Daniel Murcia Suarez
    crated Date: 02/03/21
    This component was created to list all related locations by product, 
    and the end-user has the possibility to update the Quantity of products by location.
    version. 1.0
*/
public inherited sharing class lwcMASChallengeControler{

    //This class was created to return the list of inventory, filtering by product Id.
    @AuraEnabled(Cacheable = true)
    public static List<MAS_Inventory__c> getRelatedLocation(Id productId) {
        System.debug('productId '+productId);
        return [SELECT Id, Location__r.Name, Quantity__c 
                FROM MAS_Inventory__c 
                WHERE Related_Product__c =:productId
                ORDER BY CreatedDate DESC NULLS LAST];
    }
}