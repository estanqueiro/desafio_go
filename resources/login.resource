*** Settings ***
Resource    locators.resource
Library     SeleniumLibrary


*** Keywords ***
Start Test
    Open Browser    ${BASE_URL}    ${BROWSER}
    Page Should Contain    ${sign_up}
    Maximize Browser Window

End Test
    Close Browser

Logout
    Wait Until Page Contains Element    ${repos_container}
    Click Image    ${profile}
    Wait Until Page Contains Element    ${user_logged}
    Click Button    ${logout}
    Wait Until Page Contains    ${sign_up}
    Capture Page Screenshot

Navigate To Login Page
    Click Link    ${login_page}
    Wait Until Page Contains    ${login_header}
    Capture Page Screenshot

Submit Credentials
    #Sincyng
    Input Text    ${login}    ${username}
    Input Password   ${pass}    ${password}
    Capture Page Screenshot
    Click Button    ${sign_in}

Verify Successful Login
    Wait Until Page Contains Element    ${repos_container}
    Click Image    ${profile}
    Wait Until Page Contains Element    ${user_logged}
    ${user}=    Get Text    ${user_logged}
    Should Be Equal As Strings   ${user}    ${user_profile}
    Capture Page Screenshot

