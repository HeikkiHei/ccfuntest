*** Settings ***
Documentation     A test suite with a single Gherkin style test.
...
...               This test is functionally identical to the example in
...               valid_login.robot file.
Resource          gherkin_resource.robot

Test Teardown  Close Browser

*** Test Cases ***
Valid Front Page
    Given browser is opened to front page
    Then front page should be open

Valid Add Student
    Given browser is opened to front page
    When input "666" is given to field "add-id"
    And button "add-submit" is clicked
    Then field "output" should contain "Items"

Valid Remove Student
    Given browser is opened to front page
    When input "666" is given to field "remove-id"
    And button "remove-submit" is clicked
    Then field "output" should contain "Successfully removed"

Valid Mark Task Done
    Given browser is opened to front page
    When input "666" is given to field "mark-done-id"
    And input "Week2" is given to field "mark-done-name"
    And button "mark-done-submit" is clicked
    Then field "output" should contain ""Week2": "COMPLETED","
    And field "output" should contain ""id": "666""

Valid Get All Students
    Given browser is opened to front page
    And button "get-all" is clicked
    Then field "output" should contain ""Items":"

