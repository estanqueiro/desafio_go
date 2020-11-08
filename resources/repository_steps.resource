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
    [Arguments]    ${name}    ${description}=${EMPTY}
    Input Text    ${ipt_repo_name}      ${name}
    Wait Until Page Contains Element    ${ttp_repo_available}
    Run Keyword If  '${description}'!='${EMPTY}'  Input Text    ${ipt_repo_desc}      ${description}
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

Select Delete Option
    Click Element    ${btn_settings_repo}
    Wait Until Page Contains Element    ${btn_delete_repo}
    Execute JavaScript  window.scrollTo(0,document.body.scrollHeight)
    #Scroll Element Into View    ${btn_delete_repo}
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

Select Import Repository
    [Arguments]  ${repo}
    Wait Until Page Contains Element    ${dpd_add_menu}
    Click Element    ${dpd_add_menu}
    Wait Until Page Contains    ${import_repo}
    Click Link    ${opt_import_repo}
    Wait Until Page Contains Element    ${hdr_import_repo}
    Input Text    ${ipt_import_repo}     ${repo}

Import Repository
    [Arguments]   ${repo}
    Click Button    ${btn_import_repo}
    Wait Until Page Contains Element   ${msg_import_finished}    timeout=20s
    Click Link    ${lnk_import_repo %'${repo_owner}/${imported_repo_name}'}
    Wait Until Page Contains Element    ${hdr_repo_name %'${repo}'}

Open Repository
    [Arguments]  ${repo}
    Wait Until Page Contains Element    ${sbr_repos_container}
    Click Link    ${sbr_repo_link %'${repo_owner}/${repo}'}
    Wait Until Page Contains Element    ${hdr_repo_name %'${repo}'}
    Capture Page Screenshot

Create Branch From Master
    [Arguments]  ${branch}
    ${cur_branch}=    Get Text   ${lbl_cur_branch}
    Run Keyword If    '${cur_branch}'!='master'    Click Element   ${lbl_cur_branch}
    Run Keyword If    '${cur_branch}'!='master'    Click Element   ${sel_master}
    Click Element    ${sel_branch}
    Wait Until Page Contains Element    ${ipt_branch}
    Input Text    ${ipt_branch}    ${branch}
    Press Keys    ${ipt_branch}    RETURN
    Wait Until Page Contains    Branch created.
    Capture Page Screenshot

Search Branch To Delete
    [Arguments]  ${branch}
    Click Element   ${lnk_branches}
    Wait Until Page Contains Element    ${ipt_search_branches}
    Input Text    ${ipt_search_branches}    ${branch}
    Press Keys    ${ipt_search_branches}    RETURN
    Wait Until Page Contains Element  ${rst_search}
    Capture Page Screenshot

Delete Branch
    [Arguments]  ${branch}
    Click Button    ${btn_del_branch}
    Wait Until Element Is Visible  ${msg_branch_del}
    Capture Page Screenshot

Delete Branch And Logout
    [Arguments]  ${branch}
    Search Branch To Delete    ${branch}
    Delete Branch    ${branch}
    Capture Page Screenshot
    Logout

Restore Branch
    Wait Until Element Is Visible    ${btn_restore_branch}
    Click Button    ${btn_restore_branch}
    Wait Until Element Is Visible    ${btn_del_branch}
    Capture Page Screenshot