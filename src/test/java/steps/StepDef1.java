package steps;

import org.testng.Assert;

import bddfw.Calculator;
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
	
	@When("^display section should display result as \"([^\"]*)\"$")
	public void test(String results) {
		Assert.assertEquals(Double.parseDouble(calc.getDisplay()), Double.parseDouble(results));
	}
	
	@When("^close the calculator application$")
	public void closeCalc() {
		calc = null;
	}

}
