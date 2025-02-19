public class FetchAccounts {
    public static String getAccessToken(){
        Map<String,TejaOrgCS__c> ts = TejaOrgCS__c.getAll();
        
        String clientId = ts.get('Teja').Consumer_Key__c;
        String clientSecret = ts.get('Teja').Client_Secret__c;
        String username=ts.get('Teja').UserName__c;
        String password=ts.get('Teja').Password__c + ts.get('Teja').Security_Token__c;
        String url = ts.get('Teja').URL__c+'/services/oauth2/token';
        
        //String reqbody = 'grant_type=password&client_id='+clientId+'&client_secret='+clientSecret+'&username='+username+'&password='+password;
        String reqbody = 'grant_type=password' + '&client_id='+clientId +'&client_secret='+clientSecret + '&username='+username + '&password='+password;
        
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setHeader('Content-Type','application/x-www-form-urlencoded');
        req.setBody(reqbody);
        req.setMethod('POST');
        req.setEndpoint(url);
        //req.setEndpoint('https://oscaritsols-dev-ed.my.salesforce.com/services/oauth2/token');
        System.debug('Endpoint URL::'+req.getEndpoint());
        HttpResponse res = h.send(req);
        System.debug('res:::'+res.getBody());
        OAuth2 objAuthenticationInfo = (OAuth2)JSON.deserialize(res.getbody(), OAuth2.class);
        System.debug('objAuthenticationInfo:::'+objAuthenticationInfo);
        return objAuthenticationInfo.access_token;
    }
    public void syncAccounts(){
        Map<String,TejaOrgCS__c> ts = TejaOrgCS__c.getAll();
        String url = ts.get('Teja').URL__c+'/services/apexrest/v1/getAccounts';
        String access_token = FetchAccounts.getAccessToken();
        if(access_token != null) {
            String endPoint = url;
            //String endPoint = 'https://oscaritsols-dev-ed.my.salesforce.com/services/apexrest/v1/getAccounts';
            Http h2 = new Http();
            HttpRequest req1 = new HttpRequest();
            req1.setHeader('Authorization','Bearer ' + access_token);
            req1.setHeader('Content-Type','application/json');
            req1.setHeader('accept','application/json');
            req1.setMethod('GET');
            req1.setEndpoint(endPoint);
            HttpResponse res1 = h2.send(req1);
            System.debug('res1::'+res1.getBody());
            List<JSON2Apex> lstAccounts = JSON2Apex.parse(res1.getBody());
            List<Account> acctsToUpdate = new List<Account>();
            for(JSON2Apex acc : lstAccounts){
                Account acct = new Account();
                acct.Name = acc.Name;
                acct.Industry = acc.Industry;
                acct.AccountSource = acc.AccountSource;
                acctsToUpdate.add(acct);
            }
			System.debug('acctsToUpadte::'+acctsToUpdate.size());
            upsert acctsToUpdate;
        }
    }
    class OAuth2 {
        public String id{get;set;}
        public String issued_at{get;set;}
        public String instance_url{get;set;}
        public String signature{get;set;}
        public String access_token{get;set;}    
    }   
}