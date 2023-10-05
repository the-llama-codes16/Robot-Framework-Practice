*** Settings ***
Resource          CommonlyUsedKeywords.txt
Library           RPA.Excel.Files

*** Variables ***
${PASSWORD}       JaneDoe1989

*** Test Cases ***
FlightApplication
    Open Browser    https://www.coursera.org/?authMode=login    Chrome
    Maximize Browser Window
    Sleep    3
    Wait Until Keyword Succeeds    2 min    3s    Login To Application Data Driven
    Sleep    4
