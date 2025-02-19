public class TargetPageVFController 
{
    public Static String selectedDomainUrl { get; set; }
    public Static String selectedType { get; set; }
    Public Static String a { get; set; }
    Public Static List<String> Names { get; set; }
    public Static List<SelectOption> getDomainUrls() 
    {
        List<SelectOption> domainUrls = new List<SelectOption>();
        List<Salesforce_Org__c> orgObjects = [SELECT Domain_URL__c FROM Salesforce_Org__c];
        for(Salesforce_Org__c orgObject : orgObjects) 
        {
            if(orgObject.Domain_URL__c != null) {
                domainUrls.add(new SelectOption(orgObject.Domain_URL__c, orgObject.Domain_URL__c));
            }
        }
        return domainUrls;
    }
    public List<SelectOption> getTypes() 
    {
        List<SelectOption> Types = new List<SelectOption>();
 
        Types.add(new SelectOption('Metadata', 'Metadata'));
        Types.add(new SelectOption('Objects','Objects'));
 
        return Types;
    }
      public Static Void retrieveMetadataTypes() 
    {
        if (selectedType == 'Metadata') 
        {
            a = MetadataRetrieval.retrieveAllMetadata(selectedDomainUrl);
            Names = MetadataRetrieval.J;
            System.debug(Names);

        }
    }
}