*** Settings ***
Documentation     A test suite for testing the site with invalid inputs.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

Test Setup     Run Keywords  Open Browser To Front Page  Front Page Should Be Open
Test Teardown  Close Browser


*** Test Cases ***

Invalid Add Student
    Input Text  add-id  invalid_id
    Selenium2Library.Click Button  add-submit
    Selenium2Library.Element Should Contain  output  	"invalid output"

Invalid Mark Task Done
    Input Text  mark-done-id  invalid_id
    Input Text  mark-done-name  invalid_name
    Selenium2Library.Click Button  mark-done-submit
    Selenium2Library.Element Should Contain  output  	"invalid output"
