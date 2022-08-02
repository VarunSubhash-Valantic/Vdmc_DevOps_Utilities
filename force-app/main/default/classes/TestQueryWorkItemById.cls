@isTest
private  class TestQueryWorkItemById {

    @testSetup static void setupTestData (){

        sf_devops_Work_Item__c a1 = new sf_devops_Work_Item__c();
        a1.Name = 'Work Item1';
        insert a1;

        sf_devops_Change_Submission__c b1 = new  sf_devops_Change_Submission__c() ;
        b1.name = 'Change Submission 1';
        insert b1;
        
        sf_devops_Remote_Change__c c1 = new sf_devops_Remote_Change__c();
        c1.name = 'Remote  Change 1';
        insert c1;

    }
   
    @isTest
    static void testWithValidId(){

        sf_devops_Work_Item__c a1 = [ SELECT Id, Name FROM sf_devops_Work_Item__c]  ;
        sf_devops_Work_Item__c d1 = QueryWorkItemById.getWorkItem(a1.id);
        sf_devops_Change_Submission__c b1 =[ SELECT Id, Name FROM sf_devops_Change_Submission__c] ;
        b1.sf_devops_Work_Item__c = a1.Id;
        sf_devops_Remote_Change__c c1 = [ SELECT Id, Name FROM sf_devops_Remote_Change__c] ;
        c1.sf_devops_Change_Submission__c = b1.Id;
        QueryWorkItemById handler = new QueryWorkItemById();
        test.startTest();
        handler.main(a1.Id);
        test.stopTest();
        
    }

    @isTest
    static void testWithInvalidId(){

        sf_devops_Work_Item__c a1 = [ SELECT Id, Name FROM sf_devops_Work_Item__c]  ;

        sf_devops_Work_Item__c d1 = QueryWorkItemById.getWorkItem(a1.id);
        sf_devops_Change_Submission__c b1 =[ SELECT Id, Name FROM sf_devops_Change_Submission__c] ;
        b1.sf_devops_Work_Item__c = a1.Id;
        sf_devops_Remote_Change__c c1 = [ SELECT Id, Name FROM sf_devops_Remote_Change__c] ;
        c1.sf_devops_Change_Submission__c = b1.Id;
        delete a1;
        QueryWorkItemById handler = new QueryWorkItemById();
        test.startTest();
        handler.main(a1.Id);
        test.stopTest();
        
    }

}