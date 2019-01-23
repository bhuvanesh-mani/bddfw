@Regression1
Feature: Test Suite Name Goes Here
Some Description of this test suite given here
  
  @OSAINB22 @Smoke @OSA @OPF
  Scenario: OSA INB 22
  NEW MT210 (no OSA hits)/ Match to Qualified MT103 (w/OSA hits) and RELEASED
  
    Given user login to OPF application
    When advanced search option details are entered as "Reference Field = OSA INB 22"
    Then OPF should return records matching "MT210 = Reconciled, MT103 = Pending GWL" conditions
    
    When selecting MT103 from the results
    Then transactions tab should return results matching "Payment Type = Inbound Credit, Status = Pending GWL"
    And capture EPH Transaction TRN
    And logout of OPF application
    
    Given user login to OSA application
    When search of transaction in Live Messages page # this step enters the captured TRN automatically
    Then OSA should return a line item matching the search # validation should happen here to ensure correct message returned by application
    And select the message matching TRN to view its details
    
    When releasing the message with text filled in "Release" # Could not understand Step_008, but this step should handle it
    Then confirm the release in popup window
    And logout of OSA application
    
    Given user login to OPF application
    When advanced search option details are entered as "Reference Field = OSA INB 22"
    Then OPF should return records matching "MT210 = Reconciled, MT103 = Reconciled" conditions
    
    When selecting MT103 from the results
    Then transactions tab should return results matching "Description = OSA response received with status 002 and decision RELEASED"
    
  @OSAINB22 @Smoke @OSA @OPF
  Scenario: IMMS NAR TC 1
  IMMS Narrative testing
  	
  	Given user login to MPT application
  	When search for transaction with criteria "User = XECCDLY, Search = IMMS NARR TC1"
  	Then update the transaction details to "Value Date =[Today], Amount = 100"
  	And send message with file name "OSAINB22TC.txt" from MPT to EPH # Message is stored in a location and script automatically sends it by file name
  	And logout of MPT application
  	
  	Given user login to EPH application
  	When search for transaction with details as "Value Date =[Today], Amount = 100"
  	Then verify the payment matching the criteria "Payment Status = "Accepted"
  	And capture the IMMS voucher numbers from history tab
  	And logout of EPH application
  	
  	Given user login to CICSEIB0 IMMS region as "Name=TPXBNK, User=maker, Password=****" # what is TPXBNK? update the field name here
  	When IMMS voucher numbers are entered # Script should follow all those steps as mentioned in Step6 behind the scenes
  	Then validate the details of transaction as "Status=PT, Narrative = /BNF/F72 TEST LINE 1"
  	And validate EPH database for below details
  	"""
  	IMMS NARR 1 = Field 58 Line 2
		IMMS NARR2 = Line 1  of field 72	
		IMMS NARR3 = Line 2 of field 72
		IMMS NARR 4 = Field 21
		IMMS NARR 5 = Field 57 Line 3, Line 6 and Line 7
  	"""
  	#Replace exact values in above step as required. Could design this gherkin step much simpler with application knowledge
  	
  	@PSD2 @EPH @Regression @Inbound_Validation
  	Scenario: PSD2 Interfaced MT103 Inbound validation
  	
  	Given login to BNYM MPT Messenger Application
  	
  	When user create a message with unique value <UniqueValueTag20> in Tag20
  	Then send this message from UAT5 Message Queue
  	
  	When retrieve EPH ID of payment using "Reference = <UniqueValueTag20>" in advanced search tab
  	Then payment should be returned with status "MT210 = <status1>, MT103 = <status2>"
  	And verify the payments status, debit/credit details and legal entities in DB
  	  	
  	When PPC response received in EPH history
  	Then validate the message and PSD2 leg
  	And log out of application
  	
  	#Note: <UniqueValueTag20>, <status1> and <status2> indicates data parameterized from external source (excel) for thiss scenario
  	
  	
  	@PSD2 @EPH @Regression @Outbound_Validation
  	Scenario: PSD2 Interfaced MT103 Inbound validation
  	
  	Given login to BNYM MPT Messenger Application
  	
  	When user navigate to outbound 103 message screen
  	Then send the outbound 103 message
  	
  	When retrieve EPH ID of payment using "Reference = <UniqueValueTag20>" in advanced search tab
  	Then verify message status
  	And Claim and complete work list
  	  	
  	When querying the payment in DB using EPD ID
  	Then validate the message and PSD2 leg
  	And log out of application
  	
  	#Note: <UniqueValueTag20> indicates data parameterized from external source (excel) for this scenario
  	
  	  	
  	
  	 
  	
  	
  	
  
  
  
  
    