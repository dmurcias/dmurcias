/***************************************************************************
   Desarrollado por:    Daniel Murcia Suarez
   Autor:               DGMS - danielguillermomurcia@gmail.com
   Proyecto:            Prueba Técnica Globant 2020
   Cambios (Versiones)
   -------------------------------------
   No.  Fecha       Autor                   Descripción
   ---  ----------  --------------------    --------------------------------
   1.0  15/01/2020  Daniel Murcia Suarez.   Creación de la clase helper para 
											la creacion del registro del 
											objeto proyecto.
****************************************************************************/
public class Proyecto_cls {
    public static void crearProyecto(List<Opportunity> updateOpt){
        // Se crea una lista con el objeto Proyecto 
        List<Proyecto__c > newPr = new List<Proyecto__c >();
        // Mediante un ciclo se recorre la lista opportunidades 
        for(Opportunity oplst: updateOpt){
            Proyecto__c  prt = new Proyecto__c ();         
            prt.Name = System.Label.Pry+' '+'-'+' '+oplst.Name;
            prt.Fecha_inicio__c = clsHorarioHabil.workDay(oplst.CloseDate);
            prt.Estado__c = 'Estimación'; 
            prt.Opportunity__c =oplst.Id;
            newPr.add(prt);
        }
        //Valdia si la Lista de proyectos esta con registros de ser así procede a isertar.
        if( newPr.size()>0){
            Insert newPr;   
        }
    }   
}