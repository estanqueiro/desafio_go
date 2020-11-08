*** Settings ***
Resource    ../resources/support.resource
Resource    ../resources/login_steps.resource
Resource    ../resources/repository_steps.resource

Documentation  This file contains the test cases related to repository management

Suite Setup    Start Test
Suite Teardown   End Test

*** Test Cases ***
Create a basic private repository
    [Tags]  Test
    [Setup]  Login As User
    Select Create New Repository
    Fill Repository Information    ${repo_name}    ${repo_desc}
    Select "Private" Repository
    Create Repository    ${repo_name}    ${visibility}
    [Teardown]  Delete Repository    ${repo_name}

Delete a public repository owned by yourself
    [Tags]  Regression
    [Setup]  Login As User
    Create Repository To Delete
    Select Delete Option
    Confirm Delete Option    ${repo_owner}    ${repo_to_delete}
    [Teardown]  Logout

Import a public repository
    [Tags]  Regression
    [Setup]  Login As User
    Select Import Repository    ${repo_to_import_url}
    Fill Repository Information    ${imported_repo_name}
    Select "Public" Repository
    Import Repository    ${imported_repo_name}
    [Teardown]  Delete Repository  ${imported_repo_name}

Create a branch from master
    [Tags]  Regression
    [Setup]  Login As User
    Open Repository    ${repo_to_branch}
    Create Branch From Master    ${new_branch}
    [Teardown]  Delete Branch And Logout  ${new_branch}

Delete branch from repository
    [Tags]  Regression
    [Setup]  Login As User
    Open Repository    ${repo_to_branch}
    Search Branch To Delete     ${old_branch}
    Delete Branch    ${old_branch}
    [Teardown]  Restore Branch

#Add a new file to an existing repository
#    No Operation

#Make a commit in a repository
#    No Operation
