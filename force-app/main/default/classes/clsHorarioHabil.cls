public class clsHorarioHabil {
    public static Date  workDay(Date fechaIni){
        Date finalFechaIni;
        Date startOfWeek   = fechaIni.toStartOfWeek();
        Integer dayOfWeek  = fechaIni.day() - startOfWeek.day();
        If(dayOfWeek == 5){
            finalFechaIni=fechaIni.addDays(2);
        }
        else if (dayOfWeek == 6){
            finalFechaIni=fechaIni.addDays(1);
        }
        else{
            finalFechaIni=fechaIni;
        }
        
        return finalFechaIni;
    } 
    
}