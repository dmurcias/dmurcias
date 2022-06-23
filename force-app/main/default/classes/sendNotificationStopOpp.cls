/**********************************************************************************
Autor:               Daniel Murcia
Descripción:         Clase encargada de enviar la notificación via email

Cambios (Versiones)
--------------------------------------------------------------------------------
No.  Fecha       Autor                          Descripción
---  ----------  --------------------           --------------------------------
1.0  16/10/2019  Daniel Murcia                  Creación de la clase.
**********************************************************************************/
public class sendNotificationStopOpp {
    public static void sendEmailnotification(List <Opportunity> lstOppStop,String groupAdminName){
        List<Messaging.SingleEmailMessage> sEmail = new  List<Messaging.SingleEmailMessage> ();
        for(Opportunity oppSt :lstOppStop){
            List<String> emaiAdd= new List<String>();
            emaiAdd.add(oppSt.owner.Email);
            Messaging.SingleEmailMessage mails = new Messaging.SingleEmailMessage();
            mails.setToAddresses(emaiAdd);
            mails.setWhatId(oppSt.Id);
            if(groupAdminName!= null || groupAdminName!='' ){
                mails.setCcAddresses(sendErrors.getEmailAddresses(groupAdminName));
            }
            mails.setSubject('Opp en estado '+oppSt.stageName);
            mails.setHtmlBody('Las siguiente oportunidad '+oppSt.Name+' no se ha atendido desde la fecha: '+ '<br>'+oppSt.Date_Stop_Opportunity__c+'</br>');
            sEmail.add(mails);
        }
        Messaging.sendEmail(sEmail);
    }
}