public with sharing class AuthController {
    @AuraEnabled
    public static String authenticateOrg()
    {
        String retUrl;
        String authorizationUrl = 'https://login.salesforce.com/services/oauth2/authorize';
        String clientId = '3MVG9fe4g9fhX0E6oTfR8eJWd3V9fGnL8rZQfLEO8atv.YMTePs.kB1_2ID1jOXwmnL8gq6VUi0SC_7gUinO6';
        String redirectUri = 'https://abccom-3dd-dev-ed--c.vf.force.com/apex/EmptyPage';
        

        
        Http http = New Http();
        HttpRequest req = New HttpRequest();
        req.setEndPoint(authorizationUrl+'?response_type=code&client_id='+clientId+'&redirect_uri='+redirectUri);
        req.setHeader('Content-Type','application/x-www-form-urlencoded');
        req.setMethod('POST');
        HttpResponse res = http.send(req);
        if (res.getStatusCode() == 302) 
        {
        String redirectUrl = res.getHeader('Location');
            retUrl = redirectUrl;
            System.debug (redirectUrl);
        } 
        else if (res.getStatusCode() == 200) 
        {
        System.debug(res.getBody());
        } 
        else 
        {
            System.debug('Unexpected status code: ' + res.getStatusCode());
        }
 
        System.debug(retUrl);
   	    return retUrl;
    }
}