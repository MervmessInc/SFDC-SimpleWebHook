/**
* @author support@dev.fairsail.com
* @description 
*/ 
@IsTest
public class SimpleWebHookTest {
	testmethod static void testSimpleWebHook() {

		RunInSandbox__c RunInSandbox = new RunInSandbox__c( Allow__c = SimpleWebHook.runningInASandbox() );
		insert RunInSandbox;

        Test.startTest();
		Test.setMock(HttpCalloutMock.class, new SimpleWebHookMockHttpResponse());

		Id jobID = System.enqueueJob(
			new SimpleWebHookQueueable(
				'https://maker.ifttt.com/trigger', 
                'Hello',
                'World',
                '!!!'));
		
		jobID = System.enqueueJob(
			new SimpleWebHookQueueable(
				'https://maker.ifttt.com/trigger'));

		SimpleWebHookInvocable.webHookRequest request = new SimpleWebHookInvocable.webHookRequest();
		request.uri = 'https://maker.ifttt.com/trigger';
		List<SimpleWebHookInvocable.webHookRequest> requests = new List<SimpleWebHookInvocable.webHookRequest>();
        requests.add(request);
		SimpleWebHookInvocable.sendWebHook(requests);

		Test.stopTest();
	}

	testmethod static void testRunInSandbox() {

		RunInSandbox__c RunInSandbox = new RunInSandbox__c( Allow__c = !SimpleWebHook.runningInASandbox() );
		insert RunInSandbox;

		Test.startTest();
		Test.setMock(HttpCalloutMock.class, new SimpleWebHookMockHttpResponse());

		SimpleWebHook wh = new SimpleWebHook('https://maker.ifttt.com/trigger');
		System.debug('\t*** simpleWebHook ***\n'+JSON.serializePretty(wh));
		wh.sendWebHook();

		Test.stopTest();
	}
}