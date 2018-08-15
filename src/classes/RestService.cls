@RestResource(urlMapping='/Lead/*')
global with sharing class RestService  {
    
    @HttpGet   
    global static Lead getIdLead() {
        
        RestRequest req = RestContext.request;
        Id leadId = req.params.get('id');
       
        Lead lead = [SELECT Id, Name, Email FROM Lead 
                      WHERE Id=:leadId];
        
        return lead;
      
    }
    
    @HttpPost
    global static Task createTaskOnLead(Id idLead) {
        
        Task t = new Task();
        t.Subject = 'Lead Web Comment';
        t.Priority = 'Normal';
        t.Status = 'Not Started';
        t.WhoId = idLead;
        
        insert t;

        return t;
        
    }

}