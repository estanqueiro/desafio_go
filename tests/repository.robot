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
    # Fill the information to delete and verifies that the button to delete is enabled
    # Click into the delete button
    # Verify that the repository is deleted

#Fail to create a basic public repository with unavailable name
#    [Tags]  Smoke
#    [Setup]  Login As User
#    Select Create New Repository
#    Fill Repository Information

#Create a private repository with all initializations
#    [Tags]  Regression
#    [Setup]  Login As User
#    Select Create New Repository
#    Fill Repository Information
#    Select Repository Visibility
#    Initialize Repository
#    [Teardown]  Delete Repository

#Delete a "Public" repository owned by "yourself"



#Fail to delete a "Public" repository owned by "others"

#Fail to delete a "Private" repository owned by "other"

#Add a new file to an existing repository
#    No Operation

#Make a commit in a repository
#    No Operation
