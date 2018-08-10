@isTest
private class LeadProcessingTest {
	
	@isTest static void testUpdateLeed() {
		
		List<Lead> leadLists = new List<Lead>();
		for (Integer i=0; i<3; i++){
			Lead leed = new Lead (LastName = 'test' + i, Company = 'test' + i, Status = 'Working - Contacted');
			leadLists.add(leed);
		}
		insert leadLists;

		List<Id> idLeadList = new List<Id>();
		for (Lead l : leadLists){
			idLeadList.add(l.Id);
		}

		LeadProcessing.LeadIds(idLeadList);
	}
	
}