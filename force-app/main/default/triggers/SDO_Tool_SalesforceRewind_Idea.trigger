trigger SDO_Tool_SalesforceRewind_Idea on Idea (after insert, after update, after delete) {
    SDO_Tool_SalesforceRewindTriggerHandler.publishNotifications(Trigger.oldMap, Trigger.new, Trigger.isInsert, Trigger.isUpdate, Trigger.isDelete);
}