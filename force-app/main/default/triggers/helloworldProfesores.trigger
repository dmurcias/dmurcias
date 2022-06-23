trigger helloworldProfesores on Profesores__c (before insert) {
    list<Materias__c> lstMateria = new list<Materias__c>();
    String na;
    
    for(Profesores__c pr: Trigger.new){
        if(pr.Nivel_academico__c== '006'){
            na = pr.Nivel_academico__c;
            system.debug('Nivel_academico__c'+ pr.Nivel_academico__c);
        }
        else{
            //algo
        }
    }
}