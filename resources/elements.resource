*** Settings ***
Documentation  This file contains the locators to the elements of the pages

*** Variables ***
### Landing Page ###
${txt_sign_up}=       Sign up
${ipt_user_signup}=   user[login]
${ipt_email_signup}=  user[email]
${ipt_pass_signup}=   user[password]
${btn_submit}=        css:button type="submit"

### Login ###
${lnk_login}=    /login
${ipt_login}=    id:login_field
${ipt_pass}=     id:password
${hdr_login}=    Sign in to GitHub
${txt_sign_in}=  Sign in
${err_login}=    xpath://div[@id='js-flash-container']//div[@class='container-lg px-2']

### Dashboard ###
${sbr_repos_container}=  id: repos-container
${sbr_repo_link}=        xpath://div[contains(@class,'dashboard-sidebar')]//a[@href="/%s"]

### Add Menu (Create New) ###
${dpd_add_menu}=     xpath://summary[@class='Header-link'][@aria-label='Create new…']
${opt_create_repo}=  /new
${opt_import_repo}=  /new/import

### Profile Menu ###
${dpd_profile_menu}=  xpath://summary[@class='Header-link'][@aria-label='View profile and more']
${opt_profile_out}=   xpath://summary[contains(@class,'Header-link')]
${opt_user_logged}=   xpath://div[contains(@class,'header-nav-current-user')]//strong
${opt_logout}=        Sign out

### New Repo Form ###
${frm_new_repo}=        id:new_repository
${ipt_repo_name}=       id:repository_name
${ttp_repo_available}=  xpath://dd[contains(@id,'input-check')][@class='success']
${ttp_repo_exists}=     xpath://dd[contains(@id,'input-check')][@class='error']
${ipt_repo_desc}=       id:repository_description
${lbl_public_repo}=     class:js-privacy-toggle-label-public
${lbl_private_repo}=    class:js-privacy-toggle-label-private
${btn_create_repo}=     xpath://button[@class='btn btn-primary first-in-line']

### Import Repo Form ###
${hdr_import_repo}=      xpath://h2[contains(text(),'Import')]
${ipt_import_repo}=      xpath://input[@name='vcs_url']
${btn_import_repo}=      xpath://button[contains(text(),'Begin import')]
${msg_import_finished}=  xpath://div[contains(text(),'Importing complete!')]
${lnk_import_repo}=      xpath://a[contains(text(),'%s')]

### Alerts ###
${btn_third_part}=  xpath://button[contains(@class,'flex-1')][contains(text(),'Accept')]

### Repository ###
${hdr_repo_name}=        xpath://h1//a[contains(text(),'%s')]
${hdr_repo_visibility}=  xpath://h1//span[text()='%s']

### Repository To Delete ###
${btn_settings_repo}=      xpath://span[@data-content='Settings']
${btn_delete_repo}=        xpath://summary[contains(@class,'btn-danger')][contains(text(),'Delete')]
${box_delete_repo}=        xpath=//details-dialog[@aria-label='Delete repository']
${ipt_confirm_del}=        xpath://div[contains(@class,'Box-body')]//form/p/input
${btn_del_repo_confirm} =  xpath://button[@type='submit']//span[contains(text(),'delete this repository')]

### Branch ###
${sel_branch}=           id:branch-select-menu
${lbl_cur_branch}=       xpath://span[@class='css-truncate-target']
${ipt_branch}=           id:context-commitish-filter-field
${sel_master}=           xpath://a[@class='SelectMenu-item']//span[contains(text(),'master')]
${btn_create_branch}=    xpath://button[contains(@class,'SelectMenu-item')]
${lnk_branches}=         xpath://span[contains(@class,'text-gray-light')][contains(text(),'branches')]
${ipt_search_branches}=  xpath://input[@name='query']
${txt_search_rst}=       xpath://span[text()='Search results']
${rst_search}=           css:a.branch-name
${btn_del_branch}=       xpath://button[@title='Delete this branch']
${msg_branch_del}=       xpath://span[contains(text(),'Deleted just now by')]
${btn_restore_branch}=   xpath://form//button[@name='return_to'][text()='Restore']
${msg_no_branch}=        xpath://li[contains(text(),'No branches found matching “newbranch”.')]