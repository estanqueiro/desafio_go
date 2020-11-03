*** Settings ***
Resource    ../resources/locators.resource
Resource    ../resources/login.resource
Suite Setup    Start Test
Suite Teardown   End Test



*** Test Cases ***
Successful login
    Navigate To Login Page
    Submit Credentials
    Verify Successful Login
    [Teardown]  Logout


