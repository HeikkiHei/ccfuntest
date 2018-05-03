*** Settings ***
Documentation     A test suite for testing the site with valid inputs.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

Test Setup     Run Keywords  Open Browser To Front Page  Front Page Should Be Open
Test Teardown  Close Browser


*** Test Cases ***
Valid Front Page
    Front Page Should Be Open

Valid Add Student
    Input Text  add-id  123
    Selenium2Library.Click Button  add-submit
    Selenium2Library.Element Should Contain  output  	"Items":
    Selenium2Library.Element Should Contain  output  	"id": "123"

Valid Remove Student
    Input Text  remove-id  123
    Selenium2Library.Click Button  remove-submit
    Selenium2Library.Element Should Contain  output  	"Successfully removed or no such student(s) in database. Either way, GONE."

Valid Mark Task Done
    Input Text  mark-done-id  123
    Input Text  mark-done-name  Week2
    Selenium2Library.Click Button  mark-done-submit
    Selenium2Library.Element Should Contain  output  	"Week2": "COMPLETED",
	Selenium2Library.Element Should Contain  output  	"id": "123"

Valid Get All Students
    Selenium2Library.Click Button  get-all
    Selenium2Library.Element Should Contain  output  "Items":
