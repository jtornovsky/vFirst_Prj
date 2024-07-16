@RestResource(urlMapping='/api/contacts/*')
global with sharing class ContactApi {

    @HttpGet
    global static List<Contact> getRecentContacts() {
        return [SELECT Id, FirstName, LastName, Email 
                FROM Contact 
                ORDER BY CreatedDate DESC 
                LIMIT 5];
    }

    @HttpPost
    global static String createContact(String firstName, String lastName, String email) {
        Contact newContact = new Contact(
            FirstName = firstName,
            LastName = lastName,
            Email = email
        );
        
        try {
            insert newContact;
            return newContact.Id;
        } catch (DmlException e) {
            return 'Error: ' + e.getMessage();
        }
    }
}

/*
Consumer Key	
3MVG9YFqzc_KnL.xnOl2rIpmCivYTXztCrOzdN9H8c.NEryLKU7ILRyylzsKMLAd9HsYA5XdzVYm7a_uN.HEC
Consumer Secret	
9E122706152FAFB37CD1A9C06FB33FEC2BEA0279C09CAE973107BB47F9449100

*/