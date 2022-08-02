@isTest
public class TestDataFactory {

    public static sf_devops_Work_Item__c createWorkItem () {

        sf_devops_Work_Item__c a1 = new sf_devops_Work_Item__c();
        a1.Name = 'Work Item1';
        insert a1;
        return a1;

    }

    public static sf_devops_Change_Submission__c createChangeSubmission () {

        sf_devops_Change_Submission__c b1 = new  sf_devops_Change_Submission__c() ;
        b1.name = 'Change Submission 1';
        insert b1;
        return b1;
    }

    public static  sf_devops_Remote_Change__c createRemoteChange () {

        sf_devops_Remote_Change__c c1 = new sf_devops_Remote_Change__c();
        c1.name = 'Remote  Change 1';
        insert c1;
        return c1;
    }

    @isTest
    public void myUnitTest(){

        sf_devops_Work_Item__c a1 = TestDataFactory.createWorkItem();
        sf_devops_Work_Item__c d1 = QueryWorkItemById.getWorkItem(a1.id);
        sf_devops_Change_Submission__c b1 =TestDataFactory.createChangeSubmission();
        b1.sf_devops_Work_Item__c = a1.Id;
        sf_devops_Remote_Change__c c1 = TestDataFactory.createRemoteChange();
        c1.sf_devops_Change_Submission__c = b1.Id;
        QueryWorkItemById handler = new QueryWorkItemById();
        handler.main(a1.Id);

    }
}
