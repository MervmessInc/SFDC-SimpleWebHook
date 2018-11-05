/**
 * CallableQueueLogger
 */
trigger CallableQueueLogger on CallableQueue__e (after insert) {

	CallableHandler__mdt callHandler = [
		SELECT classname__c,namespace__c
		FROM CallableHandler__mdt 
		WHERE active__c = true
		LIMIT 1
	];
	
	for (CallableQueue__e event : Trigger.New) {
		System.debug('\t*** event ***\n'+JSON.serializePretty(event));

		Map<String, Object> args = new Map<String, Object>();
		if (String.isNotEmpty(event.args__c)) {
	   	args = (Map<String, Object>)JSON.deserializeUntyped(event.args__c);
		}
		
		Callable extension = (Callable)Type.forName(callHandler.namespace__c, callHandler.classname__c).newInstance();
		Object result = extension.call(event.action__c, args);

		System.debug('\t*** result ***\n'+JSON.serializePretty(result));
	}
}
