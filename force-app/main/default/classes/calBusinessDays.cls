/**********************************************************************************
Autor:               Daniel Murcia
Descripción:         Logica que valida la cantidad de días habiles entre dos fechas.

Cambios (Versiones)
--------------------------------------------------------------------------------
No.  Fecha       Autor                          Descripción
---  ----------  --------------------           --------------------------------
1.0  06/09/2019  Daniel Murcia                  Creación de la clase.
**********************************************************************************/

public class calBusinessDays{
    public static BusinessHours bHours = [SELECT Id FROM BusinessHours 
                                          WHERE IsDefault = false 
                                          and Name ='Test Credifamilia' Limit 1] ;
    
    
    //SE VALIDA EL NUMERO DE DIAS HABILES ENTRE DOS FECHAS 
    public static Integer getNofDaysBussinesDays(DateTime sDate, DateTime eDate){
        Integer count = 0;
        while(sDate <= eDate){
            if(BusinessHours.isWithin(bHours.Id, sDate)){
                count++;
            }
            sDate = sDate.addDays(1);
        }
        system.debug('*** count ='+count);
        return count;
    }
}