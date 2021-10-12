@isTest
public with sharing class contactControllerAuraTest {
    @TestSetup
    static void createTestContacts(){
        List<Contact> listAddContacts= new List<Contact>();
        for (Integer i = 0; i < 48; i++) {
            Contact newContact = new Contact(
                LastName = 'Test' + i,
                FirstName = 'Sutap' + i
            );
            listAddContacts.add(newContact);
        }
        listAddContacts.add(new Contact(
            LastName = 'OneContact',
            FirstName = 'FirstNameContact'            
        ));
        insert listAddContacts;
    }

    @isTest
    static void fetchContactsTest() {
        Test.startTest();
        List<Contact> getContactsController = contactControllerAura.fetchContacts();
        Test.stopTest();

        List<Contact> allContacts = [
            SELECT LastName, FirstName, CreatedDate 
            FROM Contact
        ];
        
        System.assertEquals(allContacts, getContactsController);
    }

    @isTest
    static void findByNameTest() {
        Test.startTest();
        List<Contact> getOneContactsController = contactControllerAura.findByName('FirstNameContact');
        Test.stopTest();

        List<Contact> oneContacts = [
            SELECT LastName, FirstName, CreatedDate 
            FROM Contact
            WHERE FirstName = 'FirstNameContact'
        ];
        System.assertEquals(oneContacts, getOneContactsController);
    }
}
