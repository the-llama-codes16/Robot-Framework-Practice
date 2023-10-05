*** Settings ***
Library           SeleniumLibrary

*** Variables ***
@{ListVariable-Cities}
${ListVariable-City}    \

${TheresaMay}     \

*** Test Cases ***
OpenBrowserNameLocator
    Open Browser    https://ngendigital.com/practice    Chrome
    Maximize Browser Window
    Select Frame    id=iframe-05
    Sleep    2
    Input Text    name=FirstName    Jane
    Sleep    5

OpenBrowserClassLocator
    Open Browser    https://www.coursera.org/?authMode=login    Chrome
    Maximize Browser Window
    Sleep    2
    Input Text    class=css-lw3y7y    JaneDoe@gmail.com
    Sleep    2
    Input Text    name=password    JaneDoe
    Sleep    5

OpenBrowserIdLocator
    Open Browser    https://ngendigital.com/practice    Chrome
    Maximize Browser Window
    Select Frame    id=iframe-05
    Select From List By Index    id=FromCity    0
    Sleep    3

LocatingWithXPath
    Open Browser    https://www.coursera.org/?authMode=login    Chrome
    Maximize Browser Window
    Sleep    3
    Input Text    xpath://*[@id="email"]    JaneDoe@gmail.com
    Sleep    3
    Input Text    xpath://*[@id="password"]    JaneDoe
    Sleep    3

LocatingWithCSSSelector
    Open Browser    https://www.coursera.org/?authMode=login    Chrome
    Maximize Browser Window
    Sleep    3
    Input Text    css:#email    JaneDoe@gmail.com
    Sleep    3
    Input Text    css:#password    JaneDoe
    Sleep    3

AdvancedXPaths
    Open Browser    https://ngendigital.com/practice    Chrome
    Maximize Browser Window
    Sleep    2
    Select Frame    id=iframe-05
    Click Element    xpath:/html/body/fieldset[3]/input[1]
    Sleep    2
    [Teardown]    Close Browser

RelativeXPaths
    Open Browser    https://ngendigital.com/practice    Chrome
    Maximize Browser Window
    Sleep    2
    Select Frame    id=iframe-05
    Click Element    xpath://input[@value='bmw']
    Sleep    2
    [Teardown]    Close Browser

TextForXPath
    Open Browser    https://ngendigital.com/practice    Chrome
    Maximize Browser Window
    Sleep    2
    Select Frame    id=iframe-05
    Element Text Should Be    xpath://option[text()='Toronto']    Toronto
    Sleep    2

ContainsFunctionForXPath
    Open Browser    https://ngendigital.com/practice    Chrome
    Maximize Browser Window
    Sleep    2
    Select Frame    id=iframe-05
    Click Element    xpath://input[contains(@value,'bmw')]
    Sleep    5

StartsWithFunctionForXPath
    Open Browser    https://ngendigital.com/practice    Chrome
    Maximize Browser Window
    Sleep    4
    Select Frame    id=iframe-05
    Click Element    xpath://input[starts-with(@value,'bm')]
    Sleep    4

XPathWithIndex
    Open Browser    https://ngendigital.com/practice    Chrome
    Maximize Browser Window
    Sleep    4
    Select Frame    id=iframe-05
    Click Element    xpath://input[@type='checkbox' and @value='bmw']
    Sleep    4

CSSSelectorTagID
    Open Browser    https://ngendigital.com/practice    Chrome
    Maximize Browser Window
    Sleep    4
    Select Frame    id=iframe-05
    Click Element    css:input[value*='mw']
    Sleep    4

Textbox
    Open Browser    https://ngendigital.com/practice    Chrome
    Maximize Browser Window
    Sleep    3
    Select Frame    id=iframe-05
    Page Should Contain Textfield    xpath://input[@name='FirstName']    Textbox cannot be found.    Debug
    Sleep    3
    Input Text    xpath://input[@name='FirstName']    Jane
    Sleep    3
    Textfield Value Should Be    xpath://input[@name='FirstName']    Jane
    Sleep    3
    Clear Element Text    xpath://input[@name='FirstName']
    Sleep    3
    [Teardown]    Close Browser

Button
    Open Browser    https://www.coursera.org/?authMode=login    Chrome
    Maximize Browser Window
    Sleep    3
    Input Text    css:#email    JaneDoe@gmail.com
    Sleep    3
    Input Text    css:#password    JaneDoe1
    Sleep    3
    Click Button    xpath://button[text()='Login']
    Sleep    5

Checkbox
    Open Browser    https://ngendigital.com/practice    Chrome
    Maximize Browser Window
    Sleep    3
    Select Frame    id=iframe-05
    Sleep    3
    Page Should Contain Checkbox    xpath://input[@value='bmw']
    Click Element    xpath://input[@value='bmw']
    Sleep    3
    Checkbox Should Be Selected    xpath://input[@value='bmw']
    Sleep    3
    Click Element    xpath://input[@value='bmw']
    Sleep    3
    Checkbox Should Not Be Selected    xpath://input[@value='bmw']
    Sleep    3

List
    Open Browser    https://ngendigital.com/practice    Chrome
    Maximize Browser Window
    Sleep    3
    Select Frame    id=iframe-05
    Sleep    3
    Page Should Contain List    css:#FromCity
    Sleep    3
    @{ListVariable-Cities}    Get List Items    css:#FromCity
    FOR    ${ListVariable-City}    IN    @{ListVariable-Cities}
        Log    ${ListVariable-City}
    END
    List Selection Should Be    css:#FromCity    Toronto
    Select From List By Index    css:#FromCity    1
    Sleep    3
    Select From List By Index    css:#FromCity    2
    Sleep    3

RadioButton
    Open Browser    https://ngendigital.com/practice    Chrome
    Maximize Browser Window
    Sleep    3
    Select Frame    id=iframe-05
    Sleep    3
    Page Should Contain Radio Button    xpath://input[@value='flight']
    Sleep    3
    Select Radio Button    flight    flighthotel
    Sleep    3
    Radio Button Should Be Set To    flight    flighthotel
    Sleep    3

Image
    Open Browser    https://ngendigital.com/practice    Chrome
    Maximize Browser Window
    Sleep    3
    Click Image    xpath://*[@id="n-2418"]
    Sleep    3

Table
    Open Browser    https://ngendigital.com/practice    Chrome
    Maximize Browser Window
    Sleep    3
    Select Frame    id=iframe-05
    Page Should Contain Element    xpath:/html/body/fieldset[7]/table
    Table Should Contain    xpath:/html/body/fieldset[7]/table    Country
    Table Cell Should Contain    xpath:/html/body/fieldset[7]/table    2    3    Canada
    Table Column Should Contain    xpath:/html/body/fieldset[7]/table    1    Justin Trudeau
    Table Row Should Contain    xpath:/html/body/fieldset[7]/table    5    Chancellor
    ${TheresaMay}=    Get Table Cell    xpath:/html/body/fieldset[7]/table    4    1
    Should Be Equal As Strings    ${TheresaMay}    Theresa May
