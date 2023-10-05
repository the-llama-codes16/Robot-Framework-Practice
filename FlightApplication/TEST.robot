*** Settings ***
Library           SeleniumLibrary
Library           RPA.Excel.Files

*** Test Cases ***
TEST TC01
    Open Browser    https://ngendigital.com/demo-application    Chrome
