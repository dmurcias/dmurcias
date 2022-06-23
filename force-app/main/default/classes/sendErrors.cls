public class sendErrors {
    public static List<String> getEmailAddresses(String groupAdminName) {
        List<String> idList = new List<String>();
        List<String> mailToAddresses = new List<String>();
        String groupName = groupAdminName;
        // Se obtienen de los usuarios de un grupo 
        Group g = [Select (Select userOrGroupId from groupMembers) FROM group WHERE name =: groupName];
        for (GroupMember gm : g.groupMembers) {
            idList.add(gm.userOrGroupId); 
        }
        // Se obtiene el Email de los usuarios.
        User[] usr = [Select email From user Where id IN: idList];
        system.debug('test**** usr'+usr);
        for(User u : usr) {
            mailToAddresses.add(u.email);
        }
        // Retorna la lista con los emails de los usuarios del grupo
         system.debug('retorna una lista de emails.**** usr'+mailToAddresses);
        return mailToAddresses;
    }
}