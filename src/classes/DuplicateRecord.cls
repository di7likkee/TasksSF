public class DuplicateRecord  {
    @TestVisible
    private static List<FeedTrackedChange> testFeedTrackedChangeList;
    @TestVisible
    private static List<FeedItem> testFeedItemList;
    
    public static void  duplicateRecord(Id idFirstRecord, Id idSecondRecord){
        
        List<FeedItem> feedItemsList = [SELECT Id, Type, CreatedById, CreatedBy.FirstName, CreatedBy.LastName, ParentId, Parent.Name, Body, CreatedDate, 
                                        (SELECT Id, FieldName, OldValue, NewValue FROM FeedTrackedChanges) 
                                        FROM FeedItem 
                                        WHERE Type = 'TrackedChange' AND ParentId =: idFirstRecord
                                        LIMIT 20
                                       ]; 
        List <FeedItem> newFeedsList = createFeedItems(feedItemsList, idSecondRecord);
        
        insert newFeedsList;             
    }
    
    private static List <FeedItem> createFeedItems(List<FeedItem> feedItemsList, Id idSecondRecord){
        List <FeedItem> newFeedsList = new List<FeedItem>();
        if(Test.isRunningTest()){
            feedItemsList = testFeedItemList;
        }
        for (FeedItem feed : feedItemsList){         
            for(FeedTrackedChange ftc : getFeedTrackedChangeList(feed)) {
                
                FeedItem newFeed = new FeedItem();
                newFeed.ParentId = idSecondRecord;
                newFeed.CreatedDate = feed.CreatedDate;
                newFeed.Body = Label.Changed + ' ' + ftc.fieldName + ' ' + Label.from + ' ' + ftc.OldValue + ' ' + Label.to + ' ' + ftc.NewValue;
                newFeedsList.add(newFeed);
            }
        }    
        return newFeedsList;
    }

    private static List<FeedTrackedChange> getFeedTrackedChangeList(FeedItem feed){
        if(Test.isRunningTest()){
            return testFeedTrackedChangeList;
        }
        return feed.FeedTrackedChanges;
    }
    
}