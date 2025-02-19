public class SessionIdRetrieve {
    public static void getSessionId(){
        Http http = New Http();
        HttpRequest req = New HttpRequest();
        req.setEndpoint('callout:Governance_App/services/apexrest/SessionId');
        req.setHeader('Content-Type', 'application/json');
        req.setMethod('GET');
        HttpResponse res = http.send(req);
        if(res.getStatusCode()>=200 && res.getStatusCode()<300){
            String body = res.getBody();
            system.debug(body);
        }
        else {
            system.debug(res.getStatusCode());
            system.debug(res.getBody());
        }
    }
}