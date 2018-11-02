public inherited sharing class WebHookServiceHandler implements Callable {

	public class WebHookServiceHandlerException extends Exception {}

	private String sendAlert(String alert) {

		Id jobID = System.enqueueJob(
			new SimpleWebHookQueueable(alert,'',''));

		return jobID;
	}

	private User getTeamMember(String tmID) {
		User tm = [
			select Id, Name, Email, Phone, MobilePhone
			from User
			where EmployeeNumber =: tmID
		];
		return tm;
	}

	public Object call(String action, Map<String,Object> args) {
		switch on action {
			when 'sendAlert' {
				String arg1 = (String)args.get('arg1');
				Decimal arg2 = (Decimal)args.get('arg2');
				String arg3 = (String)args.get('arg3');
         	return sendAlert(arg1 + ', ' + arg2.toPlainString() + ', ' + arg3);
			}
			when 'getTeamMember' {
				String arg1 = (String)args.get('arg1');
         	return getTeamMember(arg1);
       	}
			when 'doTask3' {
         	return 'doTask2';
       	}
       	when else {
        		throw new WebHookServiceHandlerException('Method not implemented');
       	}
		}
	}

}
