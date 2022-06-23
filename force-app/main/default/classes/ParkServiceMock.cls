@isTest
global class ParkServiceMock implements WebServiceMock {
    global void doInvoke(
        Object stub,
        Object request,
        Map<String, Object> response,
        String endpoint,
        String soapAction,
        String requestName,
        String responseNS,
        String responseName,
        String responseType) {
            ParkService.byCountryResponse a= new ParkService.byCountryResponse();
            String[] park= new String[]{'Shiretoko National Park','Oze National Park','Hakusan National Park'};
                a.return_x =park;               
            response.put('response_x', a); 
        }
}