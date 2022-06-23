/**********************************************************************************
Autor:               Daniel Murcia
Descripción:         Clase encargado para la ejecucion del batch que valdiara si las
opportunidades estan en estado Stop y llevan dias sin atender

Cambios (Versiones)
--------------------------------------------------------------------------------
No.  Fecha       Autor                          Descripción
---  ----------  --------------------           --------------------------------
1.0  16/10/2019  Daniel Murcia                  Creación de la clase.
**********************************************************************************/
global class schValidateStopOpp implements Schedulable{
    String query ='SELECT Id, Name, StageName, Date_Stop_Opportunity__c, CreatedById, owner.Email, ownerId FROM Opportunity WHERE StageName =\'Stop\'';
    global void execute(SchedulableContext sContext) {
        // Llamado de la clase "btchValdiateOpportunityStop" para la ejecucion del bacth.
        btchValdiateOpportunityStop pBatch = new btchValdiateOpportunityStop();
        pBatch.Query = query;
        Database.executeBatch(pBatch,50); 
    }
}