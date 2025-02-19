public class TargetPageController 
{
    public static String selectedDomainUrl;
    public static String selectedOrgName;
    public static String selectedType ;
    public static String a;
    public static List<String> Names;
 
    public class Option 
    {
        @AuraEnabled public String label;
        @AuraEnabled public String value;
 
        public Option(String label, String value) 
        {
            this.label = label;
            this.value = value;
        }
    }
 
    // Method to fetch domain URLs
    @AuraEnabled(cacheable=true)
    public static List<Option> getOrgNames() 
    {
        List<Option> OrgNames = new List<Option>();
        // Fetch domain URLs from Salesforce_Org__c object
        List<Salesforce_Org__c> orgObjects = [SELECT Name FROM Salesforce_Org__c];
        for (Salesforce_Org__c orgObject : orgObjects) 
        {
            if (orgObject.Name != null) 
            {
                OrgNames.add(new Option(orgObject.Name, orgObject.Name));
            }
        }
        return OrgNames;
    }
 
    // Method to fetch metadata types
    @AuraEnabled(cacheable=true)
    public static List<Option> getTypes() 
    {
        List<Option> types = new List<Option>();
        types.add(new Option('Metadata Types', 'Metadata Types'));
        types.add(new Option('Objects', 'Objects'));
        return types;
    }
 
    // Method to retrieve metadata types
    @AuraEnabled
    public static List<String> retrieveMetadataTypes(String selectedType, String selectedOrgName) 
{
    List<String> Names = new List<String>();
 
    // Logic to retrieve metadata types based on selectedType
    if (selectedType == 'Metadata Types') 
    {
        Salesforce_Org__c DUrl = [Select name, Domain_Url__c from Salesforce_Org__c where Name=:selectedOrgName];
        a = MetadataRetrieval.retrieveAllMetadata(DUrl.Domain_Url__c);
        Names = MetadataRetrieval.J;
        //System.debug('Retrieved Names'+''+Names);
    }
 
    return Names;
}
}