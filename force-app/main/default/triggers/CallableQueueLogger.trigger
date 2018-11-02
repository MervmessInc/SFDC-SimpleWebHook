/**
 * CallableQueueLogger
 */
trigger CallableQueueLogger on CallableQueue__e (after insert) {

	for (CallableQueue__e event : Trigger.New) {
		Map<String, Object> args = (Map<String, Object>)JSON.deserializeUntyped(event.args__c);
		String className = 'WebHookServiceHandler'; // Typically set via configuration
      Callable extension = (Callable)Type.forName(className).newInstance();
		Object result = extension.call(event.action__c, args);

		System.debug('\t*** event ***\n'+JSON.serializePretty(event));
		System.debug('\t*** result ***\n'+JSON.serializePretty(result));
	}
}
