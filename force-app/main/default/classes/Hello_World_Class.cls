public class Hello_World_Class {
    public static void helloWorld (){
        list<Profesores__c> lstProfesores = new List<Profesores__c>();
        lstProfesores =[select id, name, aula__c from Profesores__c];
        for (Profesores__c recProf:lstProfesores){
            system.debug('Profesor : '+ recProf);
        }
    }
}