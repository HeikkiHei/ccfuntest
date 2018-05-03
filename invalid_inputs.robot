*** Settings ***
Documentation     A test suite for testing the site with invalid inputs.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

Test Setup     Run Keywords  Open Browser To Front Page  Front Page Should Be Open
Test Teardown  Close Browser


*** Test Cases ***

Invalid Id Add Student
    Input Text  add-id  arto
    Selenium2Library.Click Button  add-submit
    Selenium2Library.Element Should Contain  output  	"Items":
    Selenium2Library.Element Should Contain  output  	"id": "arto"

Invalid Inputs Remove Student
    Input Text  remove-id  invalid_id
    Selenium2Library.Click Button  remove-submit
    Selenium2Library.Element Should Contain  output  	"Successfully removed or no such student(s) in database. Either way, GONE."

Empty Id Remove Student
    Input Text  remove-id  ${EMPTY}
    Selenium2Library.Click Button  remove-submit
    Selenium2Library.Element Should Contain  output  	An error occured

Invalid Inputs Mark Task Done
    Input Text  mark-done-id  no_name
    Input Text  mark-done-name  Week30
    Selenium2Library.Click Button  mark-done-submit
    Selenium2Library.Element Should Contain  output  	"Week30": "COMPLETED",
	Selenium2Library.Element Should Contain  output  	"id": "no_name"

Empty Id Add Student
    Input Text  add-id  ${EMPTY}
    Selenium2Library.Click Button  add-submit
    Selenium2Library.Element Should Contain  output  	An error occured

Empty Both Inputs Mark Task Done
    Input Text  mark-done-id  ${EMPTY}
    Input Text  mark-done-name  ${EMPTY}
    Selenium2Library.Click Button  mark-done-submit
    Selenium2Library.Element Should Contain  output  	An error occured

Empty Id Mark Task Done
    Input Text  mark-done-id  ${EMPTY}
    Input Text  mark-done-name  Week2
    Selenium2Library.Click Button  mark-done-submit
    Selenium2Library.Element Should Contain  output  	An error occured

Empty Name Mark Task Done
    Input Text  mark-done-id  1
    Input Text  mark-done-name  ${EMPTY}
    Selenium2Library.Click Button  mark-done-submit
    Selenium2Library.Element Should Contain  output  	An error occured

Get All Students For Demo
    Selenium2Library.Click Button  get-all
    Selenium2Library.Element Should Contain  output  "Items":