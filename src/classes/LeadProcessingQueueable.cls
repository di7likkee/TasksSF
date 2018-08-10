public class LeadProcessingQueueable implements Queueable{
    private List<Id> leadIds;
    
    public LeadProcessingQueueable(List<Id> leadIds){
		this.leadIds = leadIds;      
    }
    
    public void execute(QueueableContext context) {
        Lead lead = [SELECT Id, MobilePhone FROM Lead WHERE id=: leadIds[0]];
        leadIds.remove(0);
        
        lead.MobilePhone = string.valueOf(dateTime.now().getTime());
        update lead;    
               
        if (leadIds.size() > 0){
            System.enqueueJob(new LeadProcessingQueueable(leadIds)); 
        }           
    }
    
}