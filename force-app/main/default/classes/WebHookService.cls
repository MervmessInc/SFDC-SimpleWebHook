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
	 * @param  action description
	 * @param  args   description
	 * @return        description
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