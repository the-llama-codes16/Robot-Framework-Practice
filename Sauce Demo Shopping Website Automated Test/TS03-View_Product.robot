*** Settings ***
Library           SeleniumLibrary
Resource          Common_Keywords.txt
Resource          Common_Variables.txt

*** Test Cases ***
TS03-TC11-Check Elements on Product Info Screen
    Go to Website and Log In
    Wait Until Page Contains Element    ${PRODUCTS_DISPLAYED_XPATH}
    ${first_product}=    Get WebElement    ${PRODUCTS_DISPLAYED_XPATH}
    Capture Element Screenshot    ${first_product}    EMBED
    ${first_product_name}=    Get Text    ${first_product}
    Click Element    ${first_product}
    Page Should Contain Element    ${BACK_TO_PRODUCTS_BUTTON_XPATH}
    Capture Element Screenshot    ${BACK_TO_PRODUCTS_BUTTON_XPATH}    EMBED
    Page Should Contain Element    xpath://div[@class="inventory_details_name large_size"]
    ${product_name}=    Get Text    xpath://div[@class="inventory_details_name large_size"]
    Capture Element Screenshot    xpath://div[@class="inventory_details_name large_size"]    EMBED
    Should Be Equal As Strings    ${first_product_name}    ${product_name}
    Page Should Contain Element    xpath://div[@class="inventory_details_desc large_size"]
    Capture Element Screenshot    xpath://div[@class="inventory_details_desc large_size"]    EMBED
    Page Should Contain Element    xpath://div[@class="inventory_details_price"]
    Capture Element Screenshot    xpath://div[@class="inventory_details_price"]    EMBED
    Page Should Contain Button    ${ADD_TO_CART_PRODUCT_INFO_BUTTON_XPATH}
    Capture Element Screenshot    ${ADD_TO_CART_PRODUCT_INFO_BUTTON_XPATH}    EMBED
    Page Should Contain Image    xpath://img[@class='inventory_details_img']
    Capture Element Screenshot    xpath://img[@class='inventory_details_img']    EMBED
