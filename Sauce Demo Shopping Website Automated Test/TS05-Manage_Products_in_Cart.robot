*** Settings ***
Test Teardown     Close Browser
Library           SeleniumLibrary
Resource          Common_Keywords.txt
Resource          Common_Variables.txt

*** Test Cases ***
TS05-TC14-Check Elements in Cart Screen
    Go to Website and Log In
    Click Element    ${2ND_ITEM_ADD_TO_CART_BUTTON}
    Click Element    ${5TH_ITEM_ADD_TO_CART_BUTTON}
    Click Element    ${SHOPPING_CART_ICON_XPATH}
    Element Text Should Be    ${SCREEN_TITLE_XPATH}    Your Cart
    Capture Element Screenshot    ${SCREEN_TITLE_XPATH}    EMBED
    Page Should Contain Button    ${CONTINUE_SHOPPING_BUTTON_XPATH}
    Capture Element Screenshot    ${CONTINUE_SHOPPING_BUTTON_XPATH}    EMBED
    Page Should Contain Button    ${CHECKOUT_BUTTON_XPATH}
    Capture Element Screenshot    ${CHECKOUT_BUTTON_XPATH}    EMBED
    @{products}    Get WebElements    xpath://div[@class='inventory_item_name']
    ${products_carted}    Get Length    ${products}
    Should Be True    ${products_carted} > 0
    @{product_buttons}    Get WebElements    ${REMOVE_BUTTONS_CART_SCREEN_XPATH}
    FOR    ${product_button}    IN    @{product_buttons}
        Element Text Should Be    ${product_button}    Remove
    END
