@RestResource(urlMapping='/api/accounts/*')
global with sharing class AccountApi {

    @HttpGet
    global static List<Account> getAccounts() {
        return [SELECT Id, Name FROM Account LIMIT 10];
    }

    // @HttpGet
    // @RestResource(urlMapping='/recent')
    // global static List<Account> getRecentAccounts() {
    //     return [SELECT Id, Name FROM Account ORDER BY CreatedDate DESC LIMIT 5];
    // }

    @HttpPost
    @RestResource(urlMapping='/create')
    global static String createAccount(String name, String industry) {
        Account acc = new Account(Name = name, Industry = industry);
        insert acc;
        return acc.Id;
    }

    // @HttpGet
    // @RestResource(urlMapping='/detail/*')
    // global static Account getAccountDetail() {
    //     RestRequest req = RestContext.request;
    //     String accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
    //     return [SELECT Id, Name, Industry, Phone FROM Account WHERE Id = :accountId];
    // }
}