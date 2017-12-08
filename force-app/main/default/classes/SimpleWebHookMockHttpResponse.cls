/**
* @author support@dev.fairsail.com
* @description 
*/ 
@isTest
global  class SimpleWebHookMockHttpResponse implements HttpCalloutMock {
    global HTTPResponse respond(HTTPRequest req) {

        Integer statusCode = 200;
        String respSTR = 'Congratulations! You\'ve fired the DO_THE_THING event';

        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'text/plain');
        res.setStatusCode(statusCode);
        res.setBody(respSTR);
        return res;
    }
}