/**********************************************************************************
Autor:               Daniel Murcia
Descripción:         BTCH ENCARGADO DE EJECUTAR Y VALDIAR LAS OPORTUNIDADES QUE 
ESTEN EN ESTADO STOP Y VALIDA LA CANTIDAD DE DIAS EN ESTADO STOP EN CASO DE SER
5 SE DEBE ENVIAR UNA  notificación con copia al líder de área
8 SE DEBE ENVIAR UNA  notificación con copia a el vicepresidente  de negocios

Cambios (Versiones)
--------------------------------------------------------------------------------
No.  Fecha       Autor                          Descripción
---  ----------  --------------------           --------------------------------
1.0  06/09/2019  Daniel Murcia                  Creación de la clase.
**********************************************************************************/
global class btchValdiateOpportunityStop implements Database.Batchable<SObject>{  
    public String query;
    // Consulta las oportunidades que estan en estado stop
    global Database.QueryLocator start(Database.BatchableContext bCont){
        return Database.getQueryLocator(query);
    }    
    global void execute(Database.BatchableContext bCont, List<Opportunity> scope ){ 
        if (scope.size() > 0) {
            List <Opportunity> lstOppStopFDays= new List <Opportunity>();
            
            List <Opportunity> lstOppStopEDays= new List <Opportunity>();
            
            for (Opportunity stopOpp : scope){
                Integer daysStopOpp = calBusinessDays.getNofDaysBussinesDays(stopOpp.Date_Stop_Opportunity__c,datetime.now());
                if (daysStopOpp==5){
                    system.debug('numero de días 5');
                    lstOppStopFDays.add(stopOpp);
                }
                else if (daysStopOpp==8){
                    system.debug('numero de días 8');
                    lstOppStopEDays.add(stopOpp);
                }
                else{
                    //defensive
                }
            }
            if(lstOppStopFDays.size()>0){
                system.debug('lstOppStopFDays*****'+lstOppStopFDays);
                sendNotificationStopOpp.sendEmailnotification(lstOppStopFDays, 'Líder de área');
            }
            if (lstOppStopEDays.size()>0){
                sendNotificationStopOpp.sendEmailnotification(lstOppStopEDays, 'vicepresidente de negocios');
            }
        }
    }
    global void finish(Database.BatchableContext bCont){
        
    }
}