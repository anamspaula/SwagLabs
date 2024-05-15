*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary

*** Variables ***
${LOGIN_URL}               https://www.saucedemo.com
${LOGIN_TITLE}             Swag Labs
${LOGIN_LOGO}              xpath=//div[contains(@class,'login_logo')]
${LOGIN_FIELD_USERNAME}    user-name
${LOGIN_FIELD_PASSWORD}    password
${LOGIN_BTN}               login-button
${LOGIN_MSG_ERROR}         xpath=//div[contains(@class,'error-message-container error')]            
${IVENTORY_TITLE}          xpath=//span[@class='title'][contains(.,'Products')]

*** Keywords ***
Dado que estou na página de Login
    Go To                            ${LOGIN_URL}
    Wait Until Element Is Visible    ${LOGIN_LOGO}
    Title Should Be                  ${LOGIN_TITLE}

E insiro um username válido
    [Arguments]    ${username}
    Input Text     ${LOGIN_FIELD_USERNAME}    ${username}

E insiro uma senha válida 
    [Arguments]    ${password}
    Input Text     ${LOGIN_FIELD_PASSWORD}    ${password}

E clico no botão "Login"
    Click Button    ${LOGIN_BTN}

Então sou redirecionado para a página de produtos
    Wait Until Element Is Visible    ${IVENTORY_TITLE}
    Log                              Login realizado com sucesso!
    Capture Page Screenshot

E insiro um username inválido
    ${LOGIN_USERNAME_FAKE}    FakerLibrary.Name
    Set Local Variable    ${LOGIN_USERNAME_FAKE}
    Input Text            ${LOGIN_FIELD_USERNAME}    ${LOGIN_USERNAME_FAKE}
    Log                   ${LOGIN_USERNAME_FAKE}

Então mensagem de erro deve ser exibida
    Wait Until Element Is Visible    ${LOGIN_MSG_ERROR}
    Log                              Erro: Username and password do not match any user in this service.
    Capture Page Screenshot
    
    