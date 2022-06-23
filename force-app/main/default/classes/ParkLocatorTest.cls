@isTest
public class ParkLocatorTest {
    @isTest static void testCallout() {              
        // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        String[] R = ParkLocator.country('pu');
        //String[] park= new String[]{'Shiretoko National Park','Oze National Park','Hakusan National Park'};
        //System.assertEquals(park,R); 
    }
}