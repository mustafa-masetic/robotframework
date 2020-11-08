*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${SERVER}          localhost:7272
${SELENIUM-SERVER} http://localhost:4444/wd/hub
${BROWSER}         Chrome
${DELAY}           0
${VALID USER}      demo
${VALID PASSWORD}  mode
${LOGIN URL}       http://${SERVER}/
${WELCOME URL}     http://${SERVER}/welcome.html
${ERROR URL}       http://${SERVER}/error.html

*** Keywords ***
Open Browser To Login Page
    ${chrome_options} =     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}   add_argument    headless
    Call Method    ${chrome_options}   add_argument    disable-gpu
    ${options}=     Call Method     ${chrome_options}    to_capabilities     

    Open Browser    ${LOGIN URL}    ${BROWSER}    ${SELENIUM-SERVER}     desired_capabilities=${options}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    Login Page

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Input Username
    [Arguments]    ${username}
    Input Text    username_field    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    password_field    ${password}

Submit Credentials
    Click Button    login_button

Welcome Page Should Be Open
    Location Should Be    ${WELCOME URL}
    Title Should Be    Welcome Page
