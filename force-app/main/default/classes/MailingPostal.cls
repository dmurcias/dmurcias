public class MailingPostal
{
    //dentro de <> se escribe el obejeto que se va utilizar
	public static List<Contact> SearchForContacts(String LastName, String PostalCode)
		{
            List <Contact> 
            Contact=[SELECT FirstName, LastName FROM Contact where LastName=:LastName AND MailingPostalCode=:PostalCode];
            for (integer c=0;c<Contact.size();c++)
            {
                system.debug('Contact_Id'+ Contact[c].id+'nombre'+Contact[c].FirstName+Contact[c].LastName);
            }
            return Contact;
		}
}