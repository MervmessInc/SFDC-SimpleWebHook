/**
 * CallableQueueTrigger
 */
trigger CallableQueueTrigger on CallableQueue__e (after insert) {
	System.debug('\t*** events ***\n'+JSON.serializePretty(Trigger.New));
	CallableQueueTriggerHandler.broker(Trigger.New);
}