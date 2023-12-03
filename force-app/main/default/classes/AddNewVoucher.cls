public class AddNewVoucher {
    public static void addNew(List<Voucher__c> voucher){
    List <Certification_Request__c> reqList = [SELECT Id, Name, Certification__c FROM Certification_Request__c WHERE Voucher__c=:null AND ApprovalField__c=:true ORDER BY CreatedDate LIMIT 1];
    for(Voucher__c v:voucher){
        for(Certification_Request__c c : reqList){
            if(v.Certification__c == c.Certification__c){
                c.Voucher__c = v.Id;
            }
        }
    }
    update reqList;
}
}