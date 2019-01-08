package bddfw;

public class Calculator {
	private int a;
	private int b;
	private double result;
	private String operator;

	
	/**
	 * @author bhuvaneshmani
	 * @param input
	 * This method sends input to calculator application
	 */
	public void setInput(String input) {
		if(input == null || input.trim().isEmpty())
			return;

		input = input.trim();
		String[] inputs = input.split(",");

		if(inputs.length != 4 ) 
			throw new RuntimeException("Incorrect input format to calculator application. "
					+ "Input should in format <number1>, <operator>, <number2>, =");

		this.a = Integer.parseInt(inputs[0].trim());
		this.b = Integer.parseInt(inputs[2].trim());
		this.operator = inputs[1];
		this.validateOperator(inputs[1]);
		this.performOperation();
	}
	
	
	/**
	 * @author bhuvaneshmani
	 * @return
	 * This method retrieves the value from display
	 */
	public String getDisplay() {
		return result + "";
	}

	/**
	 * @author bhuvaneshmani
	 * To perform operation
	 */
	private void performOperation() {
		switch(operator.trim().toUpperCase()) {
		case "+":
			this.result = this.a + this.b;
			break;
		case "-":
			this.result = this.a - this.b;
			break;
		case "*":
		case "X":
			this.result = this.a * this.b;
			break;
		case "/":
		case "\\":
			this.result = this.a / this.b;
			break;		
		default:
			throw new RuntimeException("Operator must be one of these: + OR - OR X OR /");
		}
	}


	/**
	 * @author bhuvaneshmani
	 * @param operator
	 * Used to validate the operator sign applicable for Calculator application
	 */
	private void validateOperator(String operator) {
		if(operator == null || operator.trim().isEmpty())
			throw new RuntimeException("only 1 operator is allowed.");

		operator = operator.trim().toUpperCase();
		switch(operator.trim().toUpperCase()) {
		case "+":
		case "-":
		case "*":
		case "X":
		case "/":
		case "\\":
			break;		
		default:
			throw new RuntimeException("Operator must be one of these: + OR - OR X OR /");
		}
		
		this.operator = operator;
	}


}
