public class AnimalLocator {
    public static String getAnimalNameById(Integer id){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+id);
        request.setMethod('GET');
        String Stresponse ='';
        HttpResponse response = http.send(request);
        system.debug('response' + response);
        
        if (response.getStatusCode() == 200) {
            
            Map<String, Object> results = (Map<String, Object>)JSON.deserializeUntyped(response.getBody());
            Map<String, Object> animals = (Map<String, Object>)results.get('animal');
            Stresponse = String.valueOf(animals.get('name'));
            system.debug('Stresponse' + Stresponse);
        }
        return Stresponse;
        
    }    
}