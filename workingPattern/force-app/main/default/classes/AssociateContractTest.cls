@isTest
public class AssociateContractTest {

     @isTest
    public static void TestMethod001(){
        Working_Pattern__c WpVar = new Working_Pattern__c();
        WpVar.Name = 'Wp Name';
        WpVar.Country__c = 'Germany';
        WpVar.Contract_Type__c = 'Full time';
        WpVar.Delivery_Area__c = 'Berlin';
        insert WpVar;
        
          
        Contact cc=new contact();
        cc.lastname = 'Test Contact';
        insert cc;
        
        Contact cc2=new contact();
        cc2.lastname = 'Test Contact2';
        insert cc2;
        
        List<Contract__c> Contracts = new List<Contract__c>();
        Contract__c con = new Contract__c();
        con.Name = 'Hello Contract';
        con.Contract_Type__c = 'Full time';
        con.Delivery_Area__c = 'Berlin';
        con.Country__c = 'Germany';
        con.Contact__c = cc.id;
        Contracts.add(con);
        Contract__c con2 = new Contract__c();
        con2.Name = 'Hello Contract Test';
        con2.Contract_Type__c = 'Full time';
        con2.Delivery_Area__c = 'Rome';
        con2.Country__c = 'Italy';
        con2.Contact__c = cc2.id;
        insert con2;
        insert Contracts;
        //con.add(new contract__c(Country__c = 'Germany', Delivery_Area__c = 'Berlin', Contract_Type__c = 'FullTime'));
        
        Test.startTest();
        AssociateContract.WorkingPattrenMethodInsert(Contracts);
        Test.stopTest();
        
       	Contract__c Cont = [Select id,Contract_Type__c, Delivery_Area__c, Country__c, Name, Working_Pattern__c from Contract__c where name = : 'Hello Contract' limit 1];
        system.assertEquals(WpVar.id , Cont.Working_Pattern__c);
        
        
    }
    
      @isTest
    public static void TestMethod002(){
        
        Working_Pattern__c WpVar = new Working_Pattern__c();
        WpVar.Name = 'Wp Name';
        WpVar.Country__c = 'Germany';
        WpVar.Contract_Type__c = 'Full time';
        WpVar.Delivery_Area__c = 'Berlin';
        insert WpVar;
        
        
        
        Working_Pattern__c WpVar2 = new Working_Pattern__c();
        WpVar2.Name = 'Wp Name';
        WpVar2.Country__c = 'Germany';
        WpVar2.Contract_Type__c = 'Full time';
        WpVar2.Delivery_Area__c = 'Hamburg';
        insert WpVar2;
        
          
        Contact cc=new contact();
        cc.lastname = 'Test Contact';
        insert cc;
        
        List<Contract__c> Contracts = new List<Contract__c>();
        Contract__c con = new Contract__c();
        con.Name = 'Hello Contract';
        con.Contract_Type__c = 'Full time';
        con.Delivery_Area__c = 'Berlin';
        con.Country__c = 'Germany';
        con.Working_Pattern__c = WpVar.id;
        con.Contact__c = cc.id;
        Contracts.add(con);
        insert Contracts;
        
        Map<Id , Contract__c> maps = new Map<Id,Contract__c>();
        For(Contract__c c : Contracts){
            maps.put(c.id,c);
        }
        
         List<Contract__c> ContractLst = new List<Contract__c>();
        Contract__c cont = [Select Name , Contract_Type__c , Delivery_Area__c ,Country__c from Contract__c where name = :'Hello Contract'];
        cont.Delivery_Area__c = 'Hamburg';
		 ContractLst.add(cont);
        
        update ContractLst;
        
        Test.startTest();
        AssociateContract.WorkingPattrenMethodUpdate(ContractLst , maps);
        Test.stopTest();
        
        Contract__c contractVal = [Select  Name , Contract_Type__c , Delivery_Area__c ,Country__c, Working_Pattern__c from Contract__c where name = :'Hello Contract'];
        System.assertEquals(WpVar2.id, contractVal.Working_Pattern__c);
    }
    
}