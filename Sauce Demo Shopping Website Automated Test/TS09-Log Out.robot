*** Settings ***
Test Teardown     Close Browser
Library           SeleniumLibrary
Resource          Common_Keywords.txt
Resource          Common_Variables.txt

*** Test Cases ***
TS09-TC27-Check for Elements in Screen
    Checkout then Proceed to Log out
    Wait Until Page Contains Element    xpath://nav[@class='bm-item-list']
    Page Should Contain Element    ${LOGOUT_BUTTON_XPATH}
    Page Should Contain Button    ${LOGOUT_CROSS_BUTTON_XPATH}
    Capture Page Screenshot    EMBED

TS09-TC28-Log Out
    Checkout then Proceed to Log out
    Wait Until Page Contains Element    xpath://nav[@class='bm-item-list']
    Wait Until Element Is Enabled    ${LOGOUT_BUTTON_XPATH}
    Click Element    ${LOGOUT_BUTTON_XPATH}
    Page Should Contain Element    ${LOG_IN_SCREEN_TITLE_XPATH}
    Capture Page Screenshot    EMBED
