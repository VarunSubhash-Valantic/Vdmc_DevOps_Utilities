public with sharing class QueryWorkItemById {

    public List <sf_devops_Work_Item__c> getWorkItem (String workId) {

        List <sf_devops_Work_Item__c> Workitem = new List <sf_devops_Work_Item__c> ();

        try {
            Workitem.add([ SELECT Id, Name FROM sf_devops_Work_Item__c WHERE Id =:workId ] ) ;


        } catch (Exception e) {
            

            System.debug('Enter valid Id');
            
        }

        return Workitem ;
       
    }

    public  List <sf_devops_Change_Submission__c > getChangeSubmission (String workItemsId) {

        List <sf_devops_Change_Submission__c> ChangeSubmission = new List  <sf_devops_Change_Submission__c> ();

        try {
            
             ChangeSubmission.add([ SELECT Id, Name FROM sf_devops_Change_Submission__c WHERE sf_devops_Work_Item__c =: workItemsId])   ;

            
        } catch (Exception e) {

            System.debug('Enter valid WorkItemId');
            
        }

        return ChangeSubmission ;

    }

    public  List < sf_devops_Remote_Change__c> getRemoteChange (List<String> changeSubmissionsId ) {

        List < sf_devops_Remote_Change__c> RemoteChange = new List < sf_devops_Remote_Change__c>();

        try {


            RemoteChange.add([ SELECT Id, Name FROM sf_devops_Remote_Change__c WHERE sf_devops_Change_Submission__c IN : changeSubmissionsId]) ;


        } catch (Exception e) {

            System.debug('Enter valid changeSubmissionsId');
            
        }

        return  RemoteChange ;
    }

    public  void main (String workItemId ) {
            List <sf_devops_Work_Item__c> Workitem = getWorkItem(workItemId);
            List <sf_devops_Change_Submission__c> ChangeSubmission = getChangeSubmission(workItemId);
            List<String> Ids = new List<String>();
            for (sf_devops_Change_Submission__c i : ChangeSubmission){
                Ids.add(i.Id);
                }  
            List < sf_devops_Remote_Change__c> RemoteChange = getRemoteChange(Ids);
            delete RemoteChange;
            delete ChangeSubmission;
            delete Workitem; 

    }

}