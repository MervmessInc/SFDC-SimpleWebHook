/**
* @author Nigel Hughes
* @description
*/
public class SimpleWebHookInvocable {

	@InvocableMethod(label='Simple Web Hook' description='Simple Web Hook')
	public static void sendWebHook (List<webHookRequest> requests) {

		for (webHookRequest request : requests) {

			if (request.value1 == null) {
				request.value1 = '';
			}
			if (request.value2 == null) {
				request.value2 = '';
			}
			if (request.value3 == null) {
				request.value3 = '';
			}

			Id jobID = System.enqueueJob(new SimpleWebHookQueueable(
				request.value1,
				request.value2,
				request.value3));
      }
   }

	public class webHookRequest {
		@InvocableVariable(required=true)
		public String value1;
		@InvocableVariable
		public String value2;
		@InvocableVariable
		public String value3;
   }
}
