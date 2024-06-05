@isTest
public class AccountNotificationTest {
	@isTest
    private static void singleAccountRecord() {
        List<Account> accList = new List<Account>();
        Account acc = new Account(Name='Test Account');
        accList.add(acc);
        insert accList;
        
        Map<Id,Account> accValue = new Map<Id,Account>([Select Id,Name from Account where Name ='Test Account']);

        Test.startTest();
        AccountNotification.sendNotification(accValue);
        Test.stopTest();
        
        List<Messaging.SingleEmailMessage> emailList = new List<Messaging.SingleEmailMessage>();
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        email.setToAddresses(new List<String>{'test@test.com'});
        email.setSubject('Test Email');
        email.setPlainTextBody('This is a test email.');
        emailList.add(email);
        
        Messaging.sendEmail(emailList);
    }
}