trigger ExampleTrigger on Contact (after insert, after delete) {
    if (trigger.isInsert)    
    {
        for (Contact cnt: Trigger.new){
            integer recordCount = Trigger.New.size();
            EmailManager.sendMail ('danielguillermomurcia@gmail.com','prueba',recordCount+'Contact were inserted is '+cnt.LastName);
        }
    }
    
    else if (trigger.isDelete)
    { 
        for (Contact cnt: Trigger.old){
            integer recordCount = Trigger.old.size();
            EmailManager.sendMail ('danielguillermomurcia@gmail.com','prueba',recordCount+'Contact is deleted'+cnt.LastName);
        }
    }
}