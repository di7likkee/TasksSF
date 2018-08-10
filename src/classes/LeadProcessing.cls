public class LeadProcessing{
    
    @InvocableMethod
    public static void LeadIds(List<Id> leadIds) {
		System.enqueueJob(new LeadProcessingQueueable(leadIds));       
    }
    
}