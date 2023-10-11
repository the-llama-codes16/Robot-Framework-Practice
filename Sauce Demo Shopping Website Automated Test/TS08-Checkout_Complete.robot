*** Settings ***
Test Teardown     Close Browser
Library           SeleniumLibrary
Resource          Common_Keywords.txt
Resource          Common_Variables.txt

*** Test Cases ***
TS08-TC25-Check Elements in Checkout Complete Screen
    Select Products and Confirm Checkout
    Element Text Should Be    ${SCREEN_TITLE_XPATH}    Checkout: Complete!
    Page Should Contain Element    ${CHECKOUT_COMPLETE_THANK_YOU_MESSAGE_XPATH}
    Page Should Contain Element    ${CHECKOUT_COMPLETE_BACK_HOME_BUTTON_XPATH}
    Capture Page Screenshot    EMBED

TS08-TC26-Go Back Home from Checkout Complete Screen
    Select Products and Confirm Checkout
    Click Button    ${CHECKOUT_COMPLETE_BACK_HOME_BUTTON_XPATH}
    Element Text Should Be    ${SCREEN_TITLE_XPATH}    Products
    Capture Page Screenshot    EMBED
