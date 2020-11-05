*** Settings ***
Resource    elements.resource
Resource    variables.resource
Library     SeleniumLibrary

Documentation  This file contains the support keywords

*** Keywords ***
Start Test
    Open Browser    ${BASE_URL}    ${BROWSER}
    Page Should Contain    ${txt_sign_up}
    ${status}=    Run Keyword And Return Status    Page Should Contain Button    ${btn_third_part}
    Run Keyword If    ${status}==True    Click Button    ${btn_third_part}
    Maximize Browser Window

End Test
    Close Browser

Open Profile Menu
    #Wait Until Page Contains Element    ${sbr_repos_container}
    Click Element    ${dpd_profile_menu}
    Wait Until Element Is Visible    ${opt_user_logged}

Sign Out
    Click Button    ${opt_logout}
    Wait Until Page Contains    ${txt_sign_up}
    Capture Page Screenshot

Logout
    Open Profile Menu
    Sign Out