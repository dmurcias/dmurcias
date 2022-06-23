public class updateAulaClass {
    @InvocableMethod
    public static void updateAulaMateriaobj(List<Id> ids){
        List <Materia_Impartida__c> materiasRelId = [select Id, Name, Materias__c,Profesor__r.aula__c, Profesor__c from Materia_Impartida__c where Profesor__c in :ids];
        Set<Id> myMatIds = new Set<Id>();       
        Map<id,Materia_Impartida__c> mapMatProf = new Map<id, Materia_Impartida__c>();        
        for (Materia_Impartida__c mImp:materiasRelId){
            myMatIds.add(mImp.Materias__c);
            mapMatProf.put(mImp.Materias__c,mImp);            
        }
        List <Materias__c> materiaList = [select Id,aula__c from Materias__c where Id in :myMatIds];        
        for (integer i= 0; i<materiaList.size();i++){
            materiaList[i].aula__c = mapMatProf.get(materiaList[i].Id).Profesor__r.aula__c;
            //system.debug('mapMatProf'+ mapMatProf.get(materiaList[i].Id).Profesor__r.aula__c);
        }   
        update materiaList;
    }
}