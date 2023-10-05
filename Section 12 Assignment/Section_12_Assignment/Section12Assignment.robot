*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
TC01
    Open Browser    https://ngendigital.com/demo-application    Chrome
    Maximize Browser Window
    Sleep    3
    Select Frame    xpath://iframe[@id='iframe-05']
    Input Text    xpath://input[@name='email']    support@ngendidgital.com
    Sleep    3
    Input Password    xpath://input[@name='passwd']    abc12345
    Sleep    3
    Click Element    xpath://div[@name='SignIn']
    Sleep    3
    Page Should Contain Element    xpath://div[@id='InvalidLogin']
    Element Text Should Be    xpath://div[@id='InvalidLogin']//label    Invalid username/password
    Sleep    3
