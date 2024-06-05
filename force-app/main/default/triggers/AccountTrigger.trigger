trigger AccountTrigger on Account (before update) {//NOPMD

    if(Trigger.isBefore && Trigger.isUpdate){
        AccountNotification.sendNotification(Trigger.newMap);
    }
}