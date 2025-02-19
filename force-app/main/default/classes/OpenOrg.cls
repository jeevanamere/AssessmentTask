public class OpenOrg {
	@AuraEnabled
    public static void myOrg(){
        String str1 = Auth.AuthToken.getAccessToken('0SO5g000000CUX5GAO','Salesforce');
        String str = 'https://oscaritsols-dev-ed.my.salesforce.com/secur/frontdoor.jsp?sid='+str1.substring(15);
        System.debug(str);
        //return str;
    }
}