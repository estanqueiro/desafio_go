*** Settings ***

*** Variables ***
### Environment ###
${BASE_URL}=    https://github.com
${BROWSER}=     Chrome

${username}=    paulo.xxxx
${password}=    xxxx
${user_profile}=    estanqueiro


### Landing Page ###
${sign_up}=    Sign up
${input_user_signup}=    user[login]
${input_email_signup}=   user[email]
${input_pass_signup}=    user[password]
${btn_submit}=           css:button type="submit"

### Login ###
${login_page}=    /login
${login}=    id:login_field
${pass}=     id:password
${login_header}=    Sign in to GitHub
${sign_in}=    Sign in

### Dashboard ###
${repos_container}=    id: repos-container
${profile}=    xpath: //summary[contains(@class,'Header-link')]//img
${profile_out}=   xpath: //summary[contains(@class,'Header-link')]
${user_logged}=    xpath: //div[contains(@class,'header-nav-current-user')]//strong
${logout}=     Sign out

