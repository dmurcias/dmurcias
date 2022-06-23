/***************************************************************************
   Desarrollado por:    Daniel Murcia Suarez
   Autor:               DGMS - danielguillermomurcia@gmail.com
   Proyecto:            Prueba Técnica Globant 2020
   Cambios (Versiones)
   -------------------------------------
   No.  Fecha       Autor                   Descripción
   ---  ----------  --------------------    --------------------------------
   1.0  15/01/2020  Daniel Murcia Suarez.   Creación del trigger.
****************************************************************************/
trigger createRelatedProject on Opportunity (after Update, after insert) {
    String Activo = System.Label.test3;
    if (Activo == 'T'){
        List<Opportunity> LstOpp = new List<Opportunity>();
        Map<Id,Opportunity> oldOpp = new Map<Id,Opportunity>();
        oldOpp = trigger.oldMap;
        // se recorre la lista de oportunidades para realizar la 
        // validación si cumple con los requerimientos para crear el registro proyecto
        for(Opportunity Opp : Trigger.new){
            If(Opp.StageName == 'Closed Won' &&  
               Opp.StageName != oldOpp.get(Opp.Id).StageName &&
               Opp.Cantidad_proyectos__c ==0 ){
                   LstOpp.add(Opp);
               }
        }
        if (LstOpp.size()>0){
            Proyecto_cls.crearProyecto(LstOpp);
        }
    }
}