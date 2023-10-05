*** Settings ***
Library           DateTime

*** Variables ***
${var1}           5    # First scalar variable
${var2}           5    # Second scalar variable
${currentDate}    \

*** Test Cases ***
TC01
    [Documentation]    This test case will check if ${var1} and ${var2} are equal.
    Should Be Equal    ${var1}    ${var2}

TC02
    ${currentDate}=    DateTime.Get Current Date
    Log To Console    ${currentDate}
