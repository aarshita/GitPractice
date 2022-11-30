public class StudentHistoryTracking {
    
    public static void StudentHistoryTrackingMethod(Map<Id, Student__c> Stunewmap , Map<Id, Student__c> Stuoldmap){
        
         StudentHistory__c Stud;
         StudentHistory__c Stud1;
         StudentHistory__c Stud2;
        
        List<StudentHistory__c> StudentList = new List<StudentHistory__c>();
        
        Map<string, string> newVal = new Map<string , string>();
        //List<String> FieldLabel = new List<String>();
        Map<String, Schema.SObjectType> gd = Schema.getGlobalDescribe();
		 Schema.SObjectType sobjType = gd.get('Student__c');
          Map<String, Schema.SObjectField> MapofField = sobjType.getDescribe().fields.getMap();
        system.debug(MapofField);
        	for(String keys: MapofField.keySet()){
         
            newVal.put(MapofField.get(keys).getDescribe().getName(), MapofField.get(keys).getDescribe().getLabel());
            //system.debug(newVal);    
            //system.debug('API NAME '+MapofField.get(keys).getDescribe().getName());
            //system.debug('LABEL NAME '+ MapofField.get(keys).getDescribe().getLabel());
        }
        
       // JSON.serialize(FieldLabel);
       // system.debug(FieldLabel);
        
        For(Student__c stu : Stunewmap.values()){
            //system.debug('stuname '+ stu.name);
            if(Stunewmap.get(stu.id).name != Stuoldmap.get(stu.id).name){
            //isName = true;
            Stud = new StudentHistory__c();
            StudentHistory__c student = new StudentHistory__c();
            student.New_Value__c = Stunewmap.get(stu.id).name;
            student.Old_Value__c = Stuoldmap.get(stu.id).name;
            student.Student__c = Stunewmap.get(stu.id).id;
            student.Record_Id__c = Stunewmap.get(stu.id).id;
            student.Field_Name__c = Student__c.Name.getDescribe().getLabel();
            StudentList.add(student);
           // system.debug(newVal.get(stu.Name));
           //Stud = student;
            } 
            
            if(Stunewmap.get(stu.id).Age__c != Stuoldmap.get(stu.id).Age__c){
                 //isAge = true;
                 Stud1 = new StudentHistory__c();
                 StudentHistory__c student1 = new StudentHistory__c();
                 student1.New_Value__c  = Stunewmap.get(stu.id).Age__c;
                 student1.Old_Value__c = Stuoldmap.get(stu.id).Age__c;
                 student1.Student__c = Stunewmap.get(stu.id).id;
                 student1.Record_Id__c = Stunewmap.get(stu.id).id;
               	 student1.Field_Name__c = Student__c.Age__c.getDescribe().getLabel();
                 StudentList.add(student1);
                 //Stud1 = student1;
            }
            
               if(Stunewmap.get(stu.id).City__c != Stuoldmap.get(stu.id).City__c){
                // isCity = true;
                 Stud2 = new StudentHistory__c();
                 StudentHistory__c student2 = new StudentHistory__c();
                 student2.New_Value__c  = Stunewmap.get(stu.id).City__c;
                 student2.Old_Value__c = Stuoldmap.get(stu.id).City__c;
                 student2.Student__c = Stunewmap.get(stu.id).id;
                 student2.Record_Id__c = Stunewmap.get(stu.id).id;
                 student2.Field_Name__c = Student__c.City__c.getDescribe().getLabel();
                 StudentList.add(student2);
                 //Stud2 = student2;
            }
        }
        
        insert StudentList;

        
    }
    
    
}