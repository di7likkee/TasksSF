@isTest
public class DuplicateRecordTest {
    @isTest static void sendIds(){
        List<Contact> conList = new List<Contact>();
        for (Integer i=0; i<2; i++){
            Contact con = new Contact (email = 'em@em.rr', LastName = 'Fix' + i);
            conList.add(con);
            
        }
        insert conList;
        
        List<FeedItem> feedItems = new List<FeedItem>();
        FeedItem f = new FeedItem();
        f.ParentId = conList[0].Id;
        f.Body = '123';
        feedItems.add(f);
        insert f;       
        
        FeedTrackedChange frc = new FeedTrackedChange();
        List<FeedTrackedChange> frcList = new List<FeedTrackedChange>();
        frcList.add(frc);
        
        DuplicateRecord.testFeedItemList = feedItems;
        DuplicateRecord.testFeedTrackedChangeList = frcList;
        
        DuplicateRecord.duplicateRecord(conList[0].Id, conList[1].Id);
        
        
        
    }
}