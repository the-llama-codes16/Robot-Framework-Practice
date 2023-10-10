*** Settings ***
Test Teardown     Close Browser
Resource          Common_Keywords.txt
Resource          Common_Variables.txt
Library           SeleniumLibrary

*** Variables ***


*** Test Cases ***
TS01-TC01-Check Elements on Login Screen
    Go to Website
    Page Should Contain Element    ${LOG_IN_SCREEN_TITLE_XPATH}
    Page Should Contain Textfield    ${USERNAME_TEXTFIELD_XPATH}
    Page Should Contain Textfield    ${PASSWORD_TEXTFIELD_XPATH}
    Page Should Contain Element    ${LOGIN_BUTTON_XPATH}
    Capture Page Screenshot    EMBED

TS01-TC02-Log In With No Username
    Go to Website
    Clear Text Field    ${USERNAME_TEXTFIELD_XPATH}
    Input Text    ${PASSWORD_TEXTFIELD_XPATH}    secret_sauce
    Wait Until Keyword Succeeds    3 times    2 s    Click Element    ${LOGIN_BUTTON_XPATH}
    Wait Until Page Contains Element    ${ERROR_LOGIN_MESSAGE_XPATH}
    ${error_message}=    Get Text    ${ERROR_LOGIN_MESSAGE_XPATH}
    Should Be Equal As Strings    ${error_message}    Epic sadface: Username is required
    Capture Page Screenshot    EMBED

TS01-TC03-Log In With No Password
    Go to Website
    Input Text    ${USERNAME_TEXTFIELD_XPATH}    standard_user
    Clear Text Field    ${PASSWORD_TEXTFIELD_XPATH}
    Wait Until Keyword Succeeds    5 times    2 s    Click Element    ${LOGIN_BUTTON_XPATH}
    Wait Until Page Contains Element    ${ERROR_LOGIN_MESSAGE_XPATH}
    ${error_message}=    Get Text    ${ERROR_LOGIN_MESSAGE_XPATH}
    Should Be Equal As Strings    ${error_message}    Epic sadface: Password is required
    Capture Page Screenshot    EMBED

TS01-TC04-Log In With Invalid Credentials
    Go to Website
    Input Text    ${USERNAME_TEXTFIELD_XPATH}    locked_out_user
    Input Text    ${PASSWORD_TEXTFIELD_XPATH}    secret_sauce
    Wait Until Keyword Succeeds    5 times    2 s    Click Element    ${LOGIN_BUTTON_XPATH}
    Wait Until Page Contains Element    ${ERROR_LOGIN_MESSAGE_XPATH}
    ${error_message}=    Get Text    ${ERROR_LOGIN_MESSAGE_XPATH}
    Should Be Equal As Strings    ${error_message}    Epic sadface: Sorry, this user has been locked out.
    Capture Page Screenshot    EMBED

TS01-TC05-Log In With Valid Credentials
    Go to Website
    Input Text    ${USERNAME_TEXTFIELD_XPATH}    standard_user
    Input Text    ${PASSWORD_TEXTFIELD_XPATH}    secret_sauce
    Wait Until Keyword Succeeds    5 times    2 s    Click Element    ${LOGIN_BUTTON_XPATH}
    Page Should Contain Element    xpath://span[@class='title']
    Capture Page Screenshot    EMBED

TS05-TC15-Remove Products and Continue Shopping
    Go to Website and Log In
    @{product_buttons}    Get WebElements    ${ADD_TO_CART_PRODUCTS_BUTTON_XPATH}
    FOR    ${product_button}    IN    @{product_buttons}
        Click Element    ${product_button}
    END
    Click Element    ${SHOPPING_CART_ICON_XPATH}
    @{remove_buttons}    Get WebElements    ${REMOVE_BUTTONS_CART_SCREEN_XPATH}
    ${remove_buttons_count}    Get Length    ${remove_buttons}
    Capture Page Screenshot    EMBED
    FOR    ${remove_button_number}    IN RANGE    ${remove_buttons_count}
        IF    (${remove_button_number} + 1) % 2 != 0
            Click Element    ${remove_buttons}[${remove_button_number}]
        END
    END
    Capture Page Screenshot    EMBED
    Click Element    ${CONTINUE_SHOPPING_BUTTON_XPATH}
    Element Text Should Be    ${SCREEN_TITLE_XPATH}    Products
    @{fresh_product_buttons}    Get WebElements    ${ADD_TO_CART_PRODUCTS_BUTTON_XPATH}
    ${fresh_buttons_count}    Get Length    ${fresh_product_buttons}
    FOR    ${fresh_button_number}    IN RANGE    ${fresh_buttons_count}
        IF    (${fresh_button_number} + 1) % 2 != 0
            Element Text Should Be    ${fresh_product_buttons}[${fresh_button_number}]    Add to cart
        END
    END
    Capture Page Screenshot    EMBED
    Click Element    ${4TH_ITEM_ADD_TO_CART_BUTTON}
    Element Text Should Be    ${4TH_ITEM_ADD_TO_CART_BUTTON}    Add to cart
    Element Text Should Be    ${SHOPPING_CART_ICON_XPATH}    2
