@isTest
private class AnimalLocatorTest 
{
    @isTest static void testPostCallout() {
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock()); 
        String ExpectedValue = AnimalLocator.getAnimalNameById(1);
        System.debug('expectedValue=' + expectedValue);
        String ActualValue = 'Tiger';
        System.assertEquals(ActualValue, ExpectedValue);
    }
}