@isTest
private class TestClass2 {

    @isTest static void validateGetWorkItem() {
		sf_devops_Work_Item__c a1 = new sf_devops_Work_Item__c();

        a1.Name = 'Work Item1';

        insert a1;
        
        sf_devops_Work_Item__c d1 = QueryWorkItemById.getWorkItem(a1.id);
        
        
        sf_devops_Change_Submission__c b1 = new  sf_devops_Change_Submission__c() ;

        b1.name = 'Change Submission 1';
        b1.sf_devops_Work_Item__c = a1.Id;

        insert b1;
        
        sf_devops_Remote_Change__c c1 = new sf_devops_Remote_Change__c();

        c1.name = 'Remote  Change 1';
        c1.sf_devops_Change_Submission__c = b1.Id;

        insert c1;
		
        QueryWorkItemById handler = new QueryWorkItemById();
        handler.main('1234');
        
    }
}