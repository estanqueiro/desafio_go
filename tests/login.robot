*** Settings ***
Resource    ../resources/support.resource
Resource    ../resources/login_steps.resource

Documentation  This file contains the test cases related to login

Suite Setup    Start Test
Suite Teardown   End Test

*** Test Cases ***
Successful login
    [Documentation]  This test case submits valid credentials and i validates the user logged in
    [Tags]  Smoke
    Navigate To Login Page
    Submit Credentials    ${valid_user}    ${valid_pass}
    Verify Successful Login
    [Teardown]  Sign Out


