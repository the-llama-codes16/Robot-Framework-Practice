*** Settings ***
Test Teardown     Close Browser
Library           SeleniumLibrary
Resource          Common_Keywords.txt
Resource          Common_Variables.txt

*** Test Cases ***
TS06-TC16-Check Elements in Checkout Screen
    Select Products for Checkout
    Element Text Should Be    ${SCREEN_TITLE_XPATH}    Checkout: Your Information
    Page Should Contain Element    ${CHECKOUT_FIRSTNAME_TEXTFIELD_XPATH}
    Capture Element Screenshot    ${CHECKOUT_FIRSTNAME_TEXTFIELD_XPATH}    EMBED
    Page Should Contain Element    ${CHECKOUT_LASTNAME_TEXTFIELD_XPATH}
    Capture Element Screenshot    ${CHECKOUT_LASTNAME_TEXTFIELD_XPATH}    EMBED
    Page Should Contain Element    ${CHECKOUT_POSTAL_CODE_TEXTFIELD_XPATH}
    Capture Element Screenshot    ${CHECKOUT_POSTAL_CODE_TEXTFIELD_XPATH}    EMBED
    Page Should Contain Element    ${CHECKOUT_CANCEL_BUTTON_XPATH}
    Capture Element Screenshot    ${CHECKOUT_CANCEL_BUTTON_XPATH}    EMBED
    Page Should Contain Element    ${CHECKOUT_CONTINUE_BUTTON_XPATH}
    Capture Element Screenshot    ${CHECKOUT_CONTINUE_BUTTON_XPATH}    EMBED

TS06-TC17-Checkout Without First Name
    Select Products for Checkout
    Clear Text Field    ${CHECKOUT_FIRSTNAME_TEXTFIELD_XPATH}
    Input Text    ${CHECKOUT_LASTNAME_TEXTFIELD_XPATH}    Doe
    Input Text    ${CHECKOUT_POSTAL_CODE_TEXTFIELD_XPATH}    1234
    Click Element    ${CHECKOUT_CONTINUE_BUTTON_XPATH}
    Element Text Should Be    ${CHECKOUT_ERROR_MESSAGE_XPATH}    Error: First Name is required
    Capture Element Screenshot    ${CHECKOUT_ERROR_MESSAGE_XPATH}    EMBED

TS06-TC18-Checkout Without Last Name
    Select Products for Checkout
    Input Text    ${CHECKOUT_FIRSTNAME_TEXTFIELD_XPATH}    Jane
    Clear Text Field    ${CHECKOUT_LASTNAME_TEXTFIELD_XPATH}
    Input Text    ${CHECKOUT_POSTAL_CODE_TEXTFIELD_XPATH}    1234
    Click Element    ${CHECKOUT_CONTINUE_BUTTON_XPATH}
    Element Text Should Be    ${CHECKOUT_ERROR_MESSAGE_XPATH}    Error: Last Name is required
    Capture Element Screenshot    ${CHECKOUT_ERROR_MESSAGE_XPATH}    EMBED


TS06-TC19-Checkout Without Zipcode
    Select Products for Checkout
    Input Text    ${CHECKOUT_FIRSTNAME_TEXTFIELD_XPATH}    Jane
    Input Text    ${CHECKOUT_LASTNAME_TEXTFIELD_XPATH}    Doe
    Clear Text Field    ${CHECKOUT_POSTAL_CODE_TEXTFIELD_XPATH}
    Click Element    ${CHECKOUT_CONTINUE_BUTTON_XPATH}
    Element Text Should Be    ${CHECKOUT_ERROR_MESSAGE_XPATH}    Error: Postal Code is required
    Capture Element Screenshot    ${CHECKOUT_ERROR_MESSAGE_XPATH}    EMBED

TS06-TC20-Cancel Checkout
    Select Products for Checkout
    Click Element    ${CHECKOUT_CANCEL_BUTTON_XPATH}
    Element Text Should Be    ${SCREEN_TITLE_XPATH}    Your Cart
    Capture Page Screenshot    EMBED

TS06-TC21-Checkout With Complete Data
    Select Products for Checkout
    Input Text    ${CHECKOUT_FIRSTNAME_TEXTFIELD_XPATH}    Jane
    Input Text    ${CHECKOUT_LASTNAME_TEXTFIELD_XPATH}    Doe
    Input Text    ${CHECKOUT_POSTAL_CODE_TEXTFIELD_XPATH}    1234
    Click Element    ${CHECKOUT_CONTINUE_BUTTON_XPATH}
    Element Text Should Be    ${SCREEN_TITLE_XPATH}    Checkout: Overview
    Capture Page Screenshot    EMBED
