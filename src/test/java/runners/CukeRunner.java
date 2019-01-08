package runners;

import cucumber.api.CucumberOptions;
import cucumber.api.testng.AbstractTestNGCucumberTests;

@CucumberOptions(
		features = {"src/test/resources/features"},
		glue = {"steps"},
		tags = {"@regression"},
		plugin = {"json:reports/json/cucumber.json", "html:reports/html"}
		)
public class CukeRunner extends  AbstractTestNGCucumberTests {

}
