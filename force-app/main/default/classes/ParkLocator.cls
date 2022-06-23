public class ParkLocator {
    String[] Nom;
    public String[] country(String Country) {
        ParkService.ParksImplPort test_x = new ParkService.ParksImplPort();
        Nom=test_x.byCountry(Country);
        System.debug('Nom'+Nom);
        Return Nom;
    }
}