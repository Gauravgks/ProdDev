public with sharing class AccountNotification {
    public static void sendNotification(Map<Id,Account> accValue) {

        Set<Id> accIds = accValue.keySet();

        Messaging.CustomNotification customNotificationObj = new Messaging.CustomNotification();
        Id userId = Userinfo.getUserId();
        customNotificationObj.setBody('Please check Account details');
        customNotificationObj.setTitle('Account Details are Updated !!');
        CustomNotificationType type = [SELECT Id FROM CustomNotificationType WHERE DeveloperName = 'Notification_Demo'];//NOPMD
        customNotificationObj.setNotificationTypeId(type.id);
        customNotificationObj.setSenderId(userId);
        customNotificationObj.setTargetId('001IR00001rNU8gYAG');
        customNotificationObj.send(new Set<String> {userId});
        
    }
}