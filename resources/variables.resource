*** Settings ***
Documentation  This file contains the data used in test cases

*** Variables ***
### Environment ###
${BASE_URL}=  https://github.com
${BROWSER}=   Chrome

### Login ###
${valid_user}=       go-contact
${valid_pass}=       G0Cont@ct    #TODO: encrypt it
${invalid_user}=     invalid_user
${invalid_pass}=     invalid_pass
${login_error_msg}=  Incorrect username or password.

### Profile ###
${user_profile}=  go-contact

### Create New Menu ####
${new_repo}=     New repository
${import_repo}=  Import repository

### New Repository ###
${repo_owner}=  go-contact
${repo_name}=   gocontact
${repo_desc}=   new test repository
${repo_visib}=  Private

### Imported Repository ###
${imported_repo_name}=    gomystore
${imported_repo_visib}=   Public

### Repository To Delete ###
${repo_to_delete}=       repositorytodelete
${repo_desc_to_delete}=  repositorydescriptiontodelete

### Repository To Import ###
${repo_to_import_url}=    https://github.com/estanqueiro/mystore.git

### Repository To Branch And Branch To Delete ###
${repo_to_branch}=  repotobranch
${new_branch}=      newbranch
${old_branch}=      oldbranch