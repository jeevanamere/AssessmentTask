public class JSON2Apex {
    public Attributes attributes;
    public String Id;
    public String Name;
    public String AccountSource;
    public String Industry;
    
    public class Attributes {
        public String type;
        public String url;
    }
    
    
    public static List<JSON2Apex> parse(String json) {
        return (List<JSON2Apex>) System.JSON.deserialize(json, List<JSON2Apex>.class);
    }
}