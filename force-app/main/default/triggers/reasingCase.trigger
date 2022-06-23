trigger reasingCase on Case (after update) {
    Set<Id> caseOwnIdSet= new Set<Id>();   
    Set<Id> groupMemberIdSet= new  Set<Id>(); 
    Group grp=new Group();
    List<GroupMember> grpmembList= new  List<GroupMember>(); 
    List<user> userList= new List<user>();   
    for(Case cas:Trigger.new){
        If (cas.OwnerId != null){
            caseOwnIdSet.add(cas.OwnerId);
        }
    } 
    grp = [Select Id,Name,Type FROM Group WHERE Type = 'Queue' AND Id =:caseOwnIdSet];
    grpmembList =[Select UserOrGroupId From GroupMember where GroupId =:grp.Id];
    for(GroupMember grpmemb : grpmembList){
        groupMemberIdSet.add(grpmemb.UserOrGroupId);
    }
    for(case c:[select id,ownerid from case where ownerid in :groupMemberIdSet]) {
       
    }
}