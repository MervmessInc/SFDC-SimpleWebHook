/**
 * WebHookService
 */
@RestResource(urlMapping='/webhook')
global class WebHookService {

	/**
	 * doGet
	 */
	@HttpGet
	global static void doGet() {
		RestContext.response.addHeader('Content-Type', 'application/json');
		RestContext.response.responseBody = Blob.valueOf(JSON.serialize(RestContext.request.params));
   }

	/**
	 * doPost
	 * http -j POST https:/<force.com site>/services/apexrest/webhook action=getTeamMember args='{"arg1":"90008053"}'
	 */
	@HttpPost
	global static String doPost(String action, String args) {

		CallableQueue__e callQueue = new CallableQueue__e(
			action__c = action,
			args__c = args);

		Eventbus.publish(callQueue);

		return 'OK';
    }

}