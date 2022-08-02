public with sharing class QueryWorkItemById {

    public static sf_devops_Work_Item__c  getWorkItem (String workId) {

        sf_devops_Work_Item__c Workitem = [ SELECT Id, Name FROM sf_devops_Work_Item__c WHERE Id =:workId ]  ;

        return Workitem ;

    }

    public static List <sf_devops_Change_Submission__c > getChangeSubmission (String workItemsId) {

        List <sf_devops_Change_Submission__c>  ChangeSubmission = [ SELECT Id, Name FROM sf_devops_Change_Submission__c WHERE sf_devops_Work_Item__c =: workItemsId]  ;

        return ChangeSubmission ;
    }

    public static List < sf_devops_Remote_Change__c> getRemoteChange (List<String> changeSubmissionsId ) {

        List < sf_devops_Remote_Change__c> RemoteChange = [ SELECT Id, Name FROM sf_devops_Remote_Change__c WHERE sf_devops_Change_Submission__c IN : changeSubmissionsId];

        return  RemoteChange ;
    }

    public  void main (String workItemId ) {

        try {

            sf_devops_Work_Item__c Workitem = getWorkItem(workItemId);
            List <sf_devops_Change_Submission__c> ChangeSubmission = getChangeSubmission(workItemId);
            List<String> Ids = new List<String>();
            for (sf_devops_Change_Submission__c i : ChangeSubmission){
                Ids.add(i.Id);
                }  
            List < sf_devops_Remote_Change__c> RemoteChange = getRemoteChange(Ids);
            delete RemoteChange;
            delete ChangeSubmission;
            delete Workitem;
            
        } catch (Exception e) {

            System.debug('Insert a valid Id');
            
        }      

    }

}