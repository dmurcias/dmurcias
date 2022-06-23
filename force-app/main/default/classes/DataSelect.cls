public with sharing class  DataSelect {
    public String selectedCountry2{get;set;}
    public String selectedCategories { get; set; }
    Public String Res   { get; set; }
    Public DataSelect() {
        Res = 'www';
    }
    public List<SelectOption> getCountriesOptions() {
        List<SelectOption> countryOptions = new List<SelectOption>();
        countryOptions.add(new SelectOption('','-None-'));
        countryOptions.add(new SelectOption('INDIA','India'));
        countryOptions.add(new SelectOption('USA','USA'));
        countryOptions.add(new SelectOption('United Kingdom','UK'));
        countryOptions.add(new SelectOption('Germany','Germany'));
        countryOptions.add(new SelectOption('Ireland','Ireland'));
        
        return countryOptions;
    }    
    public List<SelectOption> getUser() {
        
        List<SelectOption> categories = new List<SelectOption>();
        
        List <User> C =[Select ID, name from User Limit 10];
                   for (user u :C){
                categories.add(new SelectOption(u.id,u.name));
            }
            return categories;
         
    } 
    public void getresult(){
        if (Res == ''){
        Res = selectedCountry2+' '+selectedCategories;
        }
    }
}