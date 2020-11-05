*** Settings ***
Resource    support.resource

Documentation  This file contains the keywords that implement the repository tests

*** Keywords ***
Select Create New Repository
    Wait Until Page Contains Element    ${dpd_add_menu}
    Click Element    ${dpd_add_menu}
    Wait Until Page Contains    ${new_repo}
    Click Link    ${opt_create_repo}
    Wait Until Page Contains Element    ${frm_new_repo}
    Capture Page Screenshot

Fill Repository Information
    [Arguments]    ${name}    ${description}
    Input Text    ${ipt_repo_name}      ${name}
    Wait Until Page Contains Element    ${ttp_repo_available}
    Input Text    ${ipt_repo_desc}      ${description}
    Capture Page Screenshot

Select "${visibility}" Repository
    Set Test Variable    ${visibility}
    Click Element    ${lbl_${visibility.lower()}_repo}
    Capture Page Screenshot

Create Repository
    [Arguments]    ${repository}    ${visibility}
    Wait Until Element Is Enabled    ${btn_create_repo}
    Click Button    ${btn_create_repo}
    Wait Until Page Contains Element    ${hdr_repo_name % '${repository}'}
    Run Keyword If    '${visibility}'=='Private'   Wait Until Page Contains Element    ${hdr_repo_visibility % '${visibility}'}
    Capture Page Screenshot

Create Repository To Delete
    Select Create New Repository
    Fill Repository Information    ${repo_to_delete}    ${repo_desc_to_delete}
    Select "Public" Repository
    Create Repository    ${repo_to_delete}    ${visibility}

Select Repository To Delete
    [Arguments]    ${name}
    Reload Page
    Wait Until Page Contains Element    ${sbr_repos_container}
    Click Link    ${sbr_repo_link %}

Select Delete Option
    Click Element    ${btn_settings_repo}
    Wait Until Page Contains Element    ${btn_delete_repo}
    Scroll Element Into View    ${btn_delete_repo}
    Click Element    ${btn_delete_repo}
    Wait Until Page Contains Element    ${box_delete_repo}

Confirm Delete Option
    [Arguments]    ${owner}    ${name}
    ${repo}=    Set Variable    ${owner}/${name}
    Input Text    ${ipt_confirm_del}    ${repo}
    #Wait button enabled
    Click Element    ${btn_del_repo_confirm}
    #Validate Repo is Deleted
    Wait Until Page Contains Element    ${sbr_repos_container}

Delete Repository
    [Arguments]  ${name}
    Select Delete Option
    Confirm Delete Option    ${repo_owner}    ${name}
    Logout