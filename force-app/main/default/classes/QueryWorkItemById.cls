public with sharing class QueryWorkItemById {

    public static sf_devops_Work_Item__c  getWorkItem (String workId) {

        sf_devops_Work_Item__c Workitem = [ SELECT Id, Name FROM sf_devops_Work_Item__c WHERE Id =:workId ]  ;

        return Workitem ;

    }

    public static sf_devops_Change_Submission__c getChangeSubmission (String workItemsId) {

        sf_devops_Change_Submission__c  ChangeSubmission = [ SELECT Id, Name FROM sf_devops_Change_Submission__c WHERE sf_devops_Work_Item__c =: workItemsId]  ;

        return ChangeSubmission ;
    }

    public static List < sf_devops_Remote_Change__c> getRemoteChange (List<String> changeSubmissionsId ) {

        List < sf_devops_Remote_Change__c> RemoteChange = [ SELECT Id, Name FROM sf_devops_Remote_Change__c WHERE sf_devops_Change_Submission__c IN : changeSubmissionsId];

        return  RemoteChange ;
    }

    public void main (String workItemId ) {

        sf_devops_Work_Item__c Workitem = getWorkItem(workItemId);
        sf_devops_Change_Submission__c ChangeSubmission = this.getChangeSubmission(workItemId);
        changeSubmissionsId = ChangeSubmission.Id ;
        List < sf_devops_Remote_Change__c> RemoteChange = getRemoteChange(changeSubmissionsId);
        delete RemoteChange;
        delete ChangeSubmission;
        delete Workitem;

    }

}