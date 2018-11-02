@IsTest
public class SimpleWebHookTest {

	@IsTest
	static void testSimpleWebHook() {

		RunInSandbox__c runInSandbox = new RunInSandbox__c( Allow__c = SimpleWebHook.runningInASandbox() );
		insert runInSandbox;

		Test.startTest();
		Test.setMock(HttpCalloutMock.class, new SimpleWebHookMockHttpResponse());

		Id jobID = System.enqueueJob(
			new SimpleWebHookQueueable(
				'Hello',
				'World',
				'!!!'));

		jobID = System.enqueueJob(
			new SimpleWebHookQueueable());

		SimpleWebHookInvocable.webHookRequest request = new SimpleWebHookInvocable.webHookRequest();
		request.value1 = 'Hello World!!!';
		List<SimpleWebHookInvocable.webHookRequest> requests = new List<SimpleWebHookInvocable.webHookRequest>();
		requests.add(request);
		SimpleWebHookInvocable.sendWebHook(requests);

		Test.stopTest();
	}

	@IsTest
	static void testRunInSandbox() {

		RunInSandbox__c runInSandbox = new RunInSandbox__c( Allow__c = !SimpleWebHook.runningInASandbox() );
		insert runInSandbox;

		Test.startTest();
		Test.setMock(HttpCalloutMock.class, new SimpleWebHookMockHttpResponse());

		SimpleWebHook wh = new SimpleWebHook();
		System.debug('\t*** simpleWebHook ***\n'+JSON.serializePretty(wh));
		wh.sendWebHook();

		Test.stopTest();
	}
}
