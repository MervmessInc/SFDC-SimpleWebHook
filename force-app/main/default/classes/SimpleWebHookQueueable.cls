/**
* @author merv@merv.org.uk
* @description
*/
public class SimpleWebHookQueueable implements Queueable, Database.AllowsCallouts {

	String value1;
	String value2;
	String value3;

	public SimpleWebHookQueueable() {
		this.value1 = '';
		this.value2 = '';
		this.value3 = '';
	}

	public SimpleWebHookQueueable(String value1, String value2, String value3) {
		this.value1 = value1;
		this.value2 = value2;
		this.value3 = value3;
	}

	public void execute(QueueableContext context) {
        try {
        	SimpleWebHook wh = new SimpleWebHook(value1, value2, value3);
            wh.sendWebHook();
        } catch(Exception e) {
            System.debug(e.getMessage());
            throw e;
        }
    }
}
