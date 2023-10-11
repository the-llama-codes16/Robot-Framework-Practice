*** Settings ***
Test Teardown     Close Browser
Resource          Common_Keywords.txt
Resource          Common_Variables.txt
Library           SeleniumLibrary

*** Test Cases ***
TS04-TC12-Add Product in Product Info Screen
    Go to Website and Log In
    Click Element    ${PRODUCTS_DISPLAYED_XPATH}
    Click Button    ${ADD_TO_CART_PRODUCT_INFO_BUTTON_XPATH}
    Element Text Should Be    ${ADD_TO_CART_PRODUCT_INFO_BUTTON_XPATH}    Remove
    Element Text Should Be    ${NUMBER_OF_CARTED_PRODUCTS_XPATH}    1
    Capture Element Screenshot    ${SHOPPING_CART_ICON_XPATH}    EMBED
    Click Element    ${BACK_TO_PRODUCTS_BUTTON_XPATH}
    Element Text Should Be    ${SCREEN_TITLE_XPATH}    Products
    Element Text Should Be    ${ADD_TO_CART_PRODUCTS_BUTTON_XPATH}    Remove
    Capture Element Screenshot    ${ADD_TO_CART_PRODUCTS_BUTTON_XPATH}    EMBED

TS04-TC13-Add Products in Products Screen
    Go to Website and Log In
    Click Element    ${2ND_ITEM_ADD_TO_CART_BUTTON}
    Element Text Should Be    ${2ND_ITEM_ADD_TO_CART_BUTTON}    Remove
    Capture Element Screenshot    ${2ND_ITEM_ADD_TO_CART_BUTTON}    EMBED
    Element Text Should Be    ${SHOPPING_CART_ICON_XPATH}    1
    Capture Element Screenshot    ${SHOPPING_CART_ICON_XPATH}    EMBED
    Click Element    ${5TH_ITEM_ADD_TO_CART_BUTTON}
    Element Text Should Be    ${5TH_ITEM_ADD_TO_CART_BUTTON}    Remove
    Capture Element Screenshot    ${5TH_ITEM_ADD_TO_CART_BUTTON}    EMBED
    Element Text Should Be    ${SHOPPING_CART_ICON_XPATH}    2
    Capture Element Screenshot    ${SHOPPING_CART_ICON_XPATH}    EMBED

TS07-TC24-Finish Checkout
    Checkout Products and Provide Info
    Click Element    ${CHECKOUT_OVERVIEW_FINISH_BUTTON}
    Element Text Should Be    ${SCREEN_TITLE_XPATH}    Checkout: Complete!
    Capture Page Screenshot    EMBED
