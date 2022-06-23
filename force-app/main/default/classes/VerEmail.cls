public class VerEmail { 
    Cliente__c Cliente;
    public boolean Show {get;set;}
    public VerEmail (ApexPages.StandardController controller){
        Cliente=(Cliente__c)controller.getRecord();
        Show=false;
    }
    public pagereference ValidarEmail() {
        wsCdyneCom.ReturnIndicator x = new wsCdyneCom.ReturnIndicator();
        wsCdyneCom.EmailVerNoTestEmailSoap y = new wsCdyneCom.EmailVerNoTestEmailSoap();
        x=y.VerifyEmail(Cliente.CORREO_ELECTR_NICO__c,'12345');
        if (x.GoodEmail== true){
            Cliente.SERVIDOR_DE_CORREO__c=x.LastMailServer;
            insert Cliente;
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.CONFIRM,'Ingreso Satisfactorio'));
            Show=true;
        }
        else{
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Correo no es válido'));
            Show=false;
        }
        return null;
    }
}