package steps;

import java.time.Duration;
import java.time.LocalDateTime;
import cucumber.api.Scenario;
import cucumber.api.java.After;
import cucumber.api.java.Before;

public class Hooks {
	private LocalDateTime startTime;
	private LocalDateTime endTime;
	@Before
	public void before() { //Scenario scenario) {
		this.startTime = LocalDateTime.now();
	}
	@After
	public void after(Scenario scenario) {
		this.endTime = LocalDateTime.now();
		Duration duration = Duration.  between(startTime, endTime);
		System.out.println("##########Total Execution Time: " + duration.toHours() + ":"+
		duration.toMinutes() + ":" + duration.getSeconds());

	}
	
	


}
