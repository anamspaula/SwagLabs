*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${LOGIN_URL}               https://www.saucedemo.com
${LOGIN_TITLE}             Swag Labs
${LOGIN_LOGO}              xpath=//div[contains(@class,'login_logo')]
${LOGIN_FIELD_USERNAME}    user-name
${LOGIN_FIELD_PASSWORD}    password
${LOGIN_BTN}               login-button
${IVENTORY_TITLE}          xpath=//span[@class='title'][contains(.,'Products')]

*** Keywords ***
Dado que estou na página de Login
    Go To                            ${LOGIN_URL}
    Wait Until Element Is Visible    ${LOGIN_LOGO}
    Title Should Be                  ${LOGIN_TITLE}

E insiro credenciais válidas
    [Arguments]    ${username}    ${password}
    Input Text     ${LOGIN_FIELD_USERNAME}    ${username}
    Input Text     ${LOGIN_FIELD_PASSWORD}    ${password}

E clico no botão "Login"
    Click Button    ${LOGIN_BTN}

Então sou redirecionado para a página de produtos
    Wait Until Element Is Visible    ${IVENTORY_TITLE}
    Log                              Login realizado com sucesso!
    Capture Page Screenshot
    
    