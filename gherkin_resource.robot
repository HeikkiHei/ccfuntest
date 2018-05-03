*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported Selenium2Library.
Library           Selenium2Library
Resource          resource.robot

*** Keywords ***
Browser is opened to front page
    Open browser to front page

Input "${student_id}" is given to field "${field}"
    Input text  ${field}  ${student_id}  
    
Button "${button_id}" is clicked
    Selenium2Library.Click Button  ${button_id}

Field "${field_id}" should contain "${content}"
    Selenium2Library.Element Should Contain  ${field_id}  ${content}