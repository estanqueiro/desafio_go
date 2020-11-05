*** Settings ***
Resource    support.resource

Documentation  This file contains the keywords that implement the login test cases

*** Keywords ***
Navigate To Login Page
    Click Link    ${lnk_login}
    Wait Until Page Contains    ${hdr_login}
    Capture Page Screenshot

Submit Credentials
    [Arguments]  ${username}    ${password}
    Wait Until Page Contains    ${hdr_login}
    Input Text    ${ipt_login}    ${username}
    Input Password   ${ipt_pass}    ${password}
    Click Button    ${txt_sign_in}
    Capture Page Screenshot

Login As User
    Navigate To Login Page
    Submit Credentials    ${valid_user}    ${valid_pass}
    #Verify Successful Login

Verify Successful Login
    Wait Until Page Contains Element    ${sbr_repos_container}
    Click Element    ${dpd_profile_menu}
    Wait Until Page Contains Element    ${opt_user_logged}
    ${user}=    Get Text    ${opt_user_logged}
    Should Be Equal As Strings   ${user}    ${user_profile}
    Capture Page Screenshot

Login With Invalid Credentials
    [Arguments]    ${username}    ${password}
    Submit Credentials    ${username}    ${password}
    ${error}=    Get Text     ${err_login}
    Should Be Equal As Strings      ${error}    ${login_error_msg}
    Capture Page Screenshot
