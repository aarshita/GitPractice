@isTest
public class TableDataForContractApexTest {

    @isTest
    public static void MethodTesting(){
        
        Working_Pattern__c WpVar = new Working_Pattern__c();
        WpVar.Name = 'New WP';
        WpVar.Delivery_Area__C = 'Berlin';
        WpVar.Contract_Type__c = 'Full Time';
        WpVar.Country__c = 'Germany';
        Insert WpVar;
        
        Contact cc=new contact();
        cc.lastname = 'Test Contact';
        insert cc;
        
        Contract__c Cont = new Contract__c();
        Cont.Name = 'New Contract';
        Cont.Delivery_Area__C = 'Berlin';
        Cont.Contract_Type__c = 'Full time';
        Cont.Country__c = 'Germany';
        Cont.Working_Pattern__c = WpVar.Id;
        Cont.Contact__c = cc.id;
        Insert Cont;
        
        Test.startTest();
        tableDataForContractApex.tableDataRecords(Cont.Id);
        Test.stopTest();
        
        Contract__c ContractList = [Select id , Delivery_Area__C, Contract_Type__c ,Country__c , Working_Pattern__c from Contract__c];
        System.assertEquals(ContractList.Working_Pattern__c, WpVar.Id);
        
        
        
    }
    
}