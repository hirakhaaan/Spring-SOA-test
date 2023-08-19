public class HTTPCalloutClass {
    public void makeHTTPcallout(){

        HTTPRequest req= new HTTPRequest();
        req.setEndpoint('https://postman-echo.com/get?foo1=bar1&foo2=bar2');
        req.setMethod('GET');
        
        HTTPResponse res=new HTTP().send(req);

        System.debug('Response: '+res.getBody());
        
        if (res.getStatusCode() == 200) {

            // Deserializes the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());

            System.debug('Response: '+results);
        }
    }
}