public class MetadataRetrieval 
{
    @AuraEnabled
    Public Static String Name { get; set; }
    Public Static List<String> J { get; set; }
 
    // Method to retrieve all metadata types using Tooling API
    public static String retrieveAllMetadata(String instanceUrl) 
    {
        Salesforce_Org__c orgRecord = [SELECT Access_Token__c, Domain_Url__c,Name FROM Salesforce_Org__c WHERE Domain_Url__c = :instanceUrl LIMIT 1];
        String accessToken = orgRecord.Access_Token__c;
        instanceUrl = orgRecord.Domain_Url__c;
        String endpoint = instanceUrl + '/services/data/v58.0/tooling/sobjects/';
 
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('GET');
        request.setHeader('Authorization', 'Bearer ' + accessToken);
        request.setHeader('Content-Type', 'application/json');
 
        Http http = new Http();
        HttpResponse response = http.send(request);
 
        if (response.getStatusCode() == 200) 
        {
            System.debug(response.getBody());
            String responseBody = response.getBody();
 
            Map<String, Object> parsedJson = (Map<String, Object>) JSON.deserializeUntyped(responseBody);
            J = New List<String>{};
 
            List<Object> sobjects = (List<Object>) parsedJson.get('sobjects');
            for (Object sobject1 : sobjects) 
           {
            Map<String, Object> sobjectMap = (Map<String, Object>) sobject1;
            Name = (String) sobjectMap.get('name');
               J.add(Name);
            //System.debug('MetaDataTypes: ' + Name);
           }
               System.debug('MetaDataTypes:' +J);
               return response.getBody();
            } 
            else 
            {
                return 'Error: ' + response.getStatusCode() + ', ' + response.getBody();
            }
    }
}