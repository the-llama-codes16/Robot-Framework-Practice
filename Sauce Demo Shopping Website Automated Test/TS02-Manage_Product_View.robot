*** Settings ***
Test Teardown     Close Browser
Library           SeleniumLibrary
Resource          Common_Keywords.txt
Resource          Common_Variables.txt
Library           Collections

*** Variables ***

*** Test Cases ***
TS02-TC06-Check Elements on Products Screen
    Go to Website and Log In
    Page Should Contain Element    ${SCREEN_TITLE_XPATH}
    Page Should Contain Button    ${HAMBURGER_ICON_XPATH}
    Page Should Contain Element    ${SHOPPING_CART_ICON_XPATH}
    @{products}=    Get WebElements    xpath://div[@class='inventory_item']
    ${product_count}=    Get Length    ${products}
    Should Be True    ${product_count} > 0
    Capture Page Screenshot    EMBED

TS02-TC07-Sort Products A-Z
    Go to Website and Log In
    Select Filter    az
    @{products}=    Get WebElements    ${PRODUCTS_DISPLAYED_XPATH}
    @{product_names}=    Create List
    FOR    ${product}    IN    @{products}
        ${product_name}=    Get Text    ${product}
        Append To List    ${product_names}    ${product_name}
    END
    @{sorted_product_names}=    Evaluate    sorted(@{product_names})
    Should Be Equal    ${product_names}    ${sorted_product_names}
    Capture Page Screenshot    EMBED

TS02-TC08-Sort Products Z-A
    Go to Website and Log In
    Select Filter    za
    @{products}=    Get WebElements    ${PRODUCTS_DISPLAYED_XPATH}
    @{product_names}=    Create List
    FOR    ${product}    IN    @{products}
        ${product_name}=    Get Text    ${product}
        Append To List    ${product_names}    ${product_name}
    END
    @{sorted_product_names}=    Evaluate    sorted(@{product_names}, reverse=True)
    Should Be Equal    ${product_names}    ${sorted_product_names}
    Capture Page Screenshot    EMBED

TS02-TC09-Sort Products Low to High
    Go to Website and Log In
    Select Filter    lohi
    @{products}=    Get WebElements    ${PRODUCTS_DISPLAYED_PRICES_XPATH}
    @{product_prices}=    Create List
    FOR    ${product}    IN    @{products}
        ${product_price}=    Get Text    ${product}
        ${product_price}=    Evaluate    float($product_price[1:])
        Append To List    ${product_prices}    ${product_price}
    END
    @{sorted_product_prices}=    Evaluate    sorted(@{product_prices})
    Should Be Equal    ${product_prices}    ${sorted_product_prices}
    Capture Page Screenshot    EMBED

TS02-TC10-Sort Products High to Low
    Go to Website and Log In
    Select Filter    hilo
    @{products}=    Get WebElements    ${PRODUCTS_DISPLAYED_PRICES_XPATH}
    @{product_prices}=    Create List
    FOR    ${product}    IN    @{products}
        ${product_price}=    Get Text    ${product}
        ${product_price}=    Evaluate    float($product_price[1:])
        Append To List    ${product_prices}    ${product_price}
    END
    @{sorted_product_prices}=    Evaluate    sorted(@{product_prices}, reverse=True)
    Should Be Equal    ${product_prices}    ${sorted_product_prices}
    Capture Page Screenshot    EMBED
