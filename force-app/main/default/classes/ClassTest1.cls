public class ClassTest1 {
    
    public Opportunity Opp {get;set;}
    //public String myMsg {get;set;}
    // constructor
    public ClassTest1(ApexPages.StandardController sc){
        Opp = (Opportunity)sc.getRecord();
        
    }
    
    public PageReference SaveOppRecord(){
        // Se generan validacion para arrojar mensaje de error en los campos requeridos
        // según el requerimiento "Test 1".
        try{
            if(Opp.Description == ''){
                
                ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Description es un campo requerido');
                ApexPages.addMessage(myMsg);
                return null;
                
            }
            if(Opp.AccountId == null){
                ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Account Name es un campo requerido');
                ApexPages.addMessage(myMsg);
                return null;
            }
            if(Opp.OrderNumber__c == ''){
                ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Order Number es un campo requerido');
                ApexPages.addMessage(myMsg);
                return null;
            }
            if(Opp.Amount == null){
                ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Amount es un campo requerido');
                ApexPages.addMessage(myMsg);
                return null;
            }
            
            insert Opp;
            PageReference refreshPage = new PageReference('/'+Opp.Id);
            return refreshPage;
        }
        catch(Exception e){
            ApexPages.addMessages(e);
        }
        return null;
    }
}