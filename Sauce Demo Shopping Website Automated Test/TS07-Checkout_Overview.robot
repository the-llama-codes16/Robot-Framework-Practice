*** Settings ***
Test Teardown     Close Browser
Library           SeleniumLibrary
Resource          Common_Keywords.txt
Resource          Common_Variables.txt

*** Test Cases ***
TS07-TC22-Check Elements in Overview Screen
    Checkout Products and Provide Info
    Element Text Should Be    ${SCREEN_TITLE_XPATH}    Checkout: Overview
    @{checked_out_products}    Get WebElements    ${PRODUCTS_DISPLAYED_XPATH}
    ${checked_out_product_count}    Get Length    ${checked_out_products}
    Should Be True    ${checked_out_product_count} > 0
    Page Should Contain Element    xpath://div[text()="Payment Information"]
    Page Should Contain Element    xpath://div[text()="Shipping Information"]
    Page Should Contain Element    xpath://div[text()="Price Total"]
    Page Should Contain Element    xpath://div[text()="Total: $"]
    Page Should Contain Element    ${CHECKOUT_OVERVIEW_CANCEL_BUTTON}
    Page Should Contain Element    ${CHECKOUT_OVERVIEW_FINISH_BUTTON}
    Capture Page Screenshot    EMBED

TS07-TC23-Cancel Checkout in Overview Screen
    Checkout Products and Provide Info
    Click Element    ${CHECKOUT_OVERVIEW_CANCEL_BUTTON}
    Element Text Should Be    ${SCREEN_TITLE_XPATH}    Products
    Capture Page Screenshot    EMBED
