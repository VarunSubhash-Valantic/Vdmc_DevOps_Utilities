@isTest
public class TestQueryWorkItemClass{
	
    @testSetup static void setupTestData (){

        sf_devops_Work_Item__c a1 = new sf_devops_Work_Item__c();
        a1.Name = 'Work Item1';
        insert a1;

        sf_devops_Change_Submission__c b1 = new  sf_devops_Change_Submission__c() ;
        b1.name = 'Change Submission 1';
        b1.sf_devops_Work_Item__c = a1.Id;
        insert b1;
        
        sf_devops_Remote_Change__c c1 = new sf_devops_Remote_Change__c();
        c1.name = 'Remote  Change 1';
        c1.sf_devops_Change_Submission__c = b1.Id;
        insert c1;

    }

    @isTest
    static void testGetWorkItemCorrectId(){
        sf_devops_Work_Item__c a1 = [ SELECT Id, Name FROM sf_devops_Work_Item__c]  ;
        QueryWorkItemById handler = new QueryWorkItemById();
        test.startTest();
        handler.getWorkItem(a1.id);
        test.stopTest();
        
    }

    @isTest
    static void testGetWorkItemIncorrectId(){
        QueryWorkItemById handler = new QueryWorkItemById();
        test.startTest();
        handler.getWorkItem('1234');
        test.stopTest();
        
    }

    @isTest
    static void testGetChangeSubmissionCorrectInput(){

        sf_devops_Work_Item__c a1 = [ SELECT Id, Name FROM sf_devops_Work_Item__c]  ;
        QueryWorkItemById handler = new QueryWorkItemById();
        test.startTest();
        handler.getChangeSubmission(a1.id);
        test.stopTest();
    }
	@isTest
    static void testGetChangeSubmissionWrongInput(){

        QueryWorkItemById handler = new QueryWorkItemById();
        test.startTest();
        handler.getChangeSubmission('12345');
        test.stopTest();
    }

    @isTest 
    static void getRemoteChangeCorrectInput(){
        sf_devops_Change_Submission__c b1 =[ SELECT Id, Name FROM sf_devops_Change_Submission__c] ;
        QueryWorkItemById handler = new QueryWorkItemById();
        List<String> changeSubIDs = new List<String>();
        changeSubIDs.add(b1.id);
        test.startTest();
        handler.getRemoteChange(changeSubIDs);
        test.stopTest();
    }

    @isTest 
    static void getRemoteChangeWrongInput(){
        QueryWorkItemById handler = new QueryWorkItemById();
        List<String> changeSubIDs = new List<String>();
        changeSubIDs.add('1234');
        test.startTest();
        handler.getRemoteChange(changeSubIDs);
        test.stopTest();
    }
   
    @isTest
    static void testWithValidId(){
        sf_devops_Work_Item__c a1 = [ SELECT Id, Name FROM sf_devops_Work_Item__c]  ;
        QueryWorkItemById handler = new QueryWorkItemById();
        List <sf_devops_Work_Item__c> d1 = handler.getWorkItem(a1.id);
        List<sf_devops_Change_Submission__c> b1 =[ SELECT Id, Name FROM sf_devops_Change_Submission__c] ;
        List<sf_devops_Remote_Change__c> c1 = [ SELECT Id, Name FROM sf_devops_Remote_Change__c] ;
        
        test.startTest();
        handler.main(a1.Id);
        test.stopTest();
        
    }
}