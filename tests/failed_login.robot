*** Settings ***
Resource  ../resources/support.resource
Resource  ../resources/login_steps.resource

Documentation  This file contains the test cases for failed login in a data-driven format

Test Template  Login With Invalid Credentials
Suite Setup  Run Keywords    Start Test    Navigate To Login Page
Suite Teardown  End Test

*** Test Cases ***
Invalid password    ${valid_user}     ${invalid_pass}
    [Tags]  Regression
Invalid username    ${invalid_user}   ${valid_pass}
    [Tags]  Smoke
Empty username      ${EMPTY}          ${valid_pass}
    [Tags]  Smoke
Empty password      ${valid_user}     ${EMPTY}
    [Tags]  Smoke
