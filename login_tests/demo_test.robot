*** Settings ***
Library    SeleniumLibrary

Suite Teardown    Close All Browsers

*** Test Cases ***
Headless Chrome - Create Webdriver
    ${chrome_options} =     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}   add_argument    headless
    Call Method    ${chrome_options}   add_argument    disable-gpu
    ${options}=     Call Method     ${chrome_options}    to_capabilities      

    Create Webdriver desired_capabilities=${options}

    Go to     http://cnn.com

    Maximize Browser Window
    Capture Page Screenshot

Headless Chrome - Open Browser
    ${chrome_options} =     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}   add_argument    headless
    Call Method    ${chrome_options}   add_argument    disable-gpu
    ${options}=     Call Method     ${chrome_options}    to_capabilities     

    Open Browser    http://cnn.com    browser=chrome    desired_capabilities=${options}

    Maximize Browser Window
    Capture Page Screensho
                    