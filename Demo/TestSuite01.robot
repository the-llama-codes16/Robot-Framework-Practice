*** Settings ***
Library           SeleniumLibrary
Resource          UserDefinedKeywords.txt

*** Variables ***
${var1}           4    # This is my first scalar variable
${var2}           4    # This is my second scalar variable
@{USER}           Jane    Doe    # This is my first list variable
&{Credentials}    username=Jane    password=Jane

*** Test Cases ***
TC01
    [Documentation]    This is my first test case. It is used to compare 2 variables.
    ...    *This will be in bold*
    ...    _This will be in italic._
    ...    Link is http://www.google.com
    Should Be Equal    ${var1}    ${var2}

TC02
    [Tags]    LOGIN
    [Setup]    SetupDemo
    Should Not Be Equal As Strings    ${USER}[0]    ${USER}[0]
    [Teardown]    TeardownDemo

TC03
    Should Be Equal As Strings    ${Credentials}[username]    ${Credentials}[password]

TC04
    [Tags]    LOGIN
    Should Be Equal As Integers    4    4

TC05
    [Template]    Should Be Equal As Integers    # This is a comment
    4    4
    5    5
    6    6
    7    7
    8    8

TC06
    CompareTwoVariables

*** Keywords ***
SetupDemo
    Log To Console    This is the SetupDemo.

TeardownDemo
    Log To Console    This is the Teardown Demo.
