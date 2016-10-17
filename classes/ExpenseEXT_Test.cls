@isTest
public class ExpenseEXT_Test {
    
    public static testmethod void test1(){
    
    Expense__c expobj = new Expense__c();
    expobj.Amount__c=5000;
    expobj.Description__c='friends shopping';
    expobj.Event__c='shopping';
    insert expobj;
    
    Member__c memobj = new Member__c();
    memobj.Email__c='ipsita@optimizeitsystems.com';
    memobj.FirstName__c='Ipsita';
    memobj.LastName__c='Dutta';
    insert memobj;
    
    
    ExpenseMemberAssociation__c emaobj = new ExpenseMemberAssociation__c();
    emaobj.ExpenseID__c=expobj.id;
    emaobj.MemberID__c=memobj.id;
    emaobj.ContributionAmount__c=1000;
    insert emaobj;
    ExpenseEXT obj = new ExpenseEXT (new ApexPages.StandardController(expobj));
    List<ExpenseMemberAssociation__c> ge = new List<ExpenseMemberAssociation__c>();
    ge = obj.getExpMembers();
        
    }
}