public with sharing class ExpenseEXT {
    public Expense__c expObj{get;set;}
    public List<ExpenseMemberAssociation__c> memExp{get;set;}

    public ExpenseEXT(ApexPages.StandardController controller) {
        expObj = (Expense__c)controller.getRecord();
        memExp = getExpMembers();
    }
    
    public List<ExpenseMemberAssociation__c> getExpMembers(){
        return [Select ContributionAmount__c, MemberID__r.FirstName__c from ExpenseMemberAssociation__c where ExpenseID__c =: expObj.Id];
    }
}