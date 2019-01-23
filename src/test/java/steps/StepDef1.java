package steps;

import java.time.Duration;
import java.time.LocalDateTime;

import org.testng.Assert;

import bddfw.Calculator;
import cucumber.api.Scenario;
import cucumber.api.java.After;
import cucumber.api.java.Before;
import cucumber.api.java.en.When;

public class StepDef1 {
	private Calculator calc;
	
	@When("^calculator application is open$")
	public void openCalc() {
		calc = new Calculator();
	}
	
	@When("^buttons \"([^\"]*)\" pressed$")
	public void pressButtons(String input) {
		calc.setInput(input);
	}
	
	@When("^buttons ([^\"]*), ([^\\\"]*), ([^\\\"]*) are pressed$")
	public void pressButton(String number1, String operator, String number2) {
		String input = number1 + "," + operator + "," + number2 + ",=";
		calc.setInput(input);
	}
		
	
	@When("^display section should display result as \"([^\"]*)\"$")
	public void test(String results) {
		Assert.assertEquals(Double.parseDouble(calc.getDisplay()), Double.parseDouble(results));
	}
	
	@When("^display section should display result as ([^\"]*)$")
	public void testResult(String results) {
		Assert.assertEquals(Double.parseDouble(calc.getDisplay()), Double.parseDouble(results));
	}
	
	@When("^close the calculator application$")
	public void closeCalc() {
		calc = null;
	}

}
