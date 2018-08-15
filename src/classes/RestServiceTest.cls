@isTest
private class RestServiceTest {
    
    @isTest static void testHttpGet() {
        
        Lead l = new Lead(LastName = 'test', 
                          Company = 'test', 
                          Status = 'Working - Contacted', 
                          Email = 'test@test.ru');
        insert l;
        
        RestRequest req = new RestRequest();        
        req.params.put('id',l.id);
        RestContext.request = req;
        
        Test.startTest();
        RestService.getIdLead();
        Test.stopTest();
        
    }
    
    @isTest static void testHttpPost() {
        
        Lead l = new Lead(LastName = 'test', 
                          Company = 'test', 
                          Status = 'Working - Contacted');
        insert l;
        
        Test.startTest();
        RestService.createTaskOnLead(l.Id);
        Test.stopTest();
        
    }
    
}