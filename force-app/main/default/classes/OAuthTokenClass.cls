public class OAuthTokenClass {
    public static String code{get;set;}
    public static String accessToken {get;set;}
    public static String refreshToken{get;set;}
    public static String DomainUrl{get;set;}
    public static String Id{get;set;}
    
    public static void retrieveCode(){
            code = ApexPages.currentPage().getParameters().get('code');
        System.debug(code);
             String grant_type = 'authorization_code';
             String clientId = '3MVG9fe4g9fhX0E6oTfR8eJWd3V9fGnL8rZQfLEO8atv.YMTePs.kB1_2ID1jOXwmnL8gq6VUi0SC_7gUinO6';
             String clientSecret = '6E966FCBFD4D5824A0EFA2FE5AF299BB8AD5CF7A9FBFEF4BE8343165C4DC1F6D&';
             String authorizationUrl = 'https://login.salesforce.com/services/oauth2/token';
             String redirectUri = 'https://abccom-3dd-dev-ed--c.vf.force.com/apex/EmptyPage';
            
        Http http = New Http();
        HttpRequest req = New HttpRequest();
        req.setEndPoint(authorizationUrl+'?grant_type=authorization_code&code='+code+'&client_id='+clientId+'&client_secret='+clientSecret+'&redirect_uri='+redirectUri);
        req.setHeader('Content-Type','application/x-www-form-urlencoded');
        req.setMethod('POST');
        HttpResponse res = http.send(req);
            
            if(res.getStatusCode()==200){
                 Wrapper wrp = (Wrapper)JSON.deserialize(res.getBody(), Wrapper.class);
                 accessToken = wrp.access_token;
 
                 refreshToken = wrp.refresh_token;
                 DomainUrl = wrp.instance_Url;
                 Id = Wrp.Id;
                
               // domainUrl += '/secur/frontdoor.jsp?sid=' + accessToken;
                
                System.debug('Access Token: ' + accessToken);
                System.debug('Refresh Token: ' + refreshToken);
                System.debug('Domain Url: ' + DomainUrl);
                System.debug('Id: ' + Id);
                //System.debug('Access Token: ' + wrp.access_token);
                //System.debug('Refresh Token: ' + wrp.refresh_token);
                //System.debug(res.getBody());
                Salesforce_Org__c S = [select id, Access_Token__c, Domain_URL__c, SystemModstamp from Salesforce_Org__c where Domain_URL__c=:DomainUrl LIMIT 1];
                
                S.Access_Token__c = accessToken;
                S.Refresh_Token__c = refreshtoken;
                S.Authenticated_On__c = s.SystemModstamp;
                Update(S); 
                 
            }
        }
    public class Wrapper 
    {
        public String access_token;
        public String refresh_token;
        public String signature;
        public String scope;
        public String id_token;
        public String instance_url;
        public String id;
        public String token_type;
        public String issued_at;
    }
}