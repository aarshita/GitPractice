public with sharing class getUsersApex {
   
    @AuraEnabled
    public static Results getUsersData(){
        try {

            string endpoint = 'https://randomuser.me/api/';
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            request.setEndPoint(endpoint);
            request.setMethod('GET');
            httpResponse response = http.send(request);
            Results getuser = new Results();
            getUser = (Results)System.JSON.deserialize(response.getBody() , Results.class);
            return getUser;

        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    public class Results{
        @AuraEnabled public list<ResultsWrapper> results;
       
    }

    public class Picture{
        @AuraEnabled public string large;
    }

    public class Name{
        @AuraEnabled public string first;
        @AuraEnabled public string last;
    }

    public class ResultsWrapper{
       @AuraEnabled public string gender;
       @AuraEnabled public string email;
       @AuraEnabled public Picture picture;
       @AuraEnabled public Name name;
       @AuraEnabled public String phone; 
    }
    
}