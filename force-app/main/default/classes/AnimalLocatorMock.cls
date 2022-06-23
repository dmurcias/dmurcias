@isTest
global class AnimalLocatorMock implements HttpCalloutMock {
global HTTPResponse respond (HTTPRequest request) {
    system.debug('AnimalLocatorMock');
    HttpResponse response = new HttpResponse();
    response.setHeader('ContentType', 'application/json');    
    response.setBody('{ "animal": { "id": "1", "name": "Tiger",  "eats": "meat", "says": "roar"}}');
    response.setStatusCode(200);
    return response; 
  }
}