/**
* @author support@dev.fairsail.com
* @description 
*/ 
public class SimpleWebHook {
	String uri;
	EventBody eventBody;

    public simpleWebHook (String uri) {
		this.uri = uri;
		this.eventBody = new EventBody('','','');
    }

    public simpleWebHook (String uri, String value1, String value2, String value3) {
		this.uri = uri;
		this.eventBody = new EventBody(value1,value2,value3);
    }

    public void sendWebHook () {

		Boolean AllowSandBox = RunInSandbox__c.getInstance(UserInfo.getUserId()).Allow__c;

		if((AllowSandBox && runningInASandbox()) || (!AllowSandBox && !runningInASandbox())) {

			HttpRequest req = new HttpRequest();
			HttpResponse res = new HttpResponse();
			Http http = new Http();

			uri = uri;
			req.setEndpoint(URI);
			req.setMethod('POST');
			req.setHeader('Content-Type','application/json');
			req.setBody(JSON.serialize(eventBody));

			try {
				res = http.send(req);
				if(res.getStatusCode() != 200) {
					System.debug('\t*** HttpResponse ***\n' + res.toString());
					System.debug('\t*** Body ***\n' + res.getBody());
				}
			} catch(System.CalloutException e) {
				System.debug('Callout error: '+ e);
				System.debug('\t*** HttpResponse ***\n' + res.toString());
				System.debug('\t*** Body ***\n' + res.getBody());
			}
		} else {
			System.debug('\t*** Check Allow SandBox ***\n\tAllowSandBox:'+AllowSandBox+'\n\trunningInASandbox():'+runningInASandbox());
		}
    }

	private class EventBody {
		String value1;
		String value2;
		String value3;

		EventBody(String value1, String value2, String value3) {
			this.value1 = value1;
			this.value2 = value2;
			this.value3 = value3;
		}
	}

	public static Boolean runningInASandbox() {
		return [SELECT IsSandbox FROM Organization LIMIT 1].IsSandbox;
	}
}