*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported Selenium2Library.
Library           Selenium2Library

*** Variables ***
${SERVER}         https://your-url-here.com/index.html
${BROWSER}        Chrome
${DELAY}          2

*** Keywords ***
Open Browser To Front Page
    Open Browser    ${SERVER}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}

Front Page Should Be Open
    Title Should Be    Course Management

