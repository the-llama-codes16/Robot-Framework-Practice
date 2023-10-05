*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
AssignmentInternetExplorer
    Open Browser    https://google.com    edge

AssignmentFirefox
    Open Browser    https://google.com    firefox
