*** Settings ***
Resource         ../resources/Resource.robot
Resource         ../resources/PO/Login.robot
Test Setup       Abrir Navegador
Test Teardown    Fechar Navegador

*** Test Cases ***

Caso de Teste 01 - Credenciais Válidas
    [Documentation]    Esse teste valida se o login está ocorrendo conforme o esperado ao utilizar credenciais Válidas
    [Tags]             login_valido
    Login.Dado que estou na página de Login
    Login.E insiro um username válido    standard_user 
    Login.E insiro uma senha válida      secret_sauce
    Login.E clico no botão "Login"
    Login.Então sou redirecionado para a página de produtos

Caso de Teste 02 - Username Inválido
    [Documentation]    Esse teste valida se é apresentado erro ao tentar logar com username Inválido
    [Tags]    username_invalido
    Login.Dado que estou na página de Login
    Login.E insiro um username inválido
    Login.E insiro uma senha válida    secret_sauce
    Login.E clico no botão "Login"
    Login.Então mensagem de erro deve ser exibida

Caso de Teste 03 - Senha Inválida
    [Documentation]    Esse teste valida se é apresentado erro ao tentar logar com uma senha Inválida
    [Tags]             senha_invalida
    Login.Dado que estou na página de Login 
    Login.E insiro um username válido    standard_user
    Login.E insiro uma senha inválida
    Login.E clico no botão "Login"
    Login.Então mensagem de erro deve ser exibida

Caso de Teste 04 - Credenciais vazias
    [Documentation]    Esse teste valida se é possível realizar o login sem inserir as credenciais 
    [Tags]             login_invalido
    Login.Dado que estou na página de Login
    Login.E clico no botão "Login"
    Login.Então mensagem de erro deve ser exibida

Caso de Teste 05 - Username vazio
    [Documentation]    Esse teste valida se é possível realizar um login sem inserir o username
    [Tags]             username_vazio
    Login.Dado que estou na página de Login
    Login.E insiro uma senha válida    secret_sauce
    Login.E clico no botão "Login"
    Login.Então mensagem de erro deve ser exibida

Caso de Teste 06 - Senha vazia
    [Documentation]    Esse teste valida se é possível realizar um login sem inserir a senha
    [Tags]             senha_vazia
    Login.Dado que estou na página de Login
    Login.E insiro um username válido    standard_user
    Login.E clico no botão "Login"
    Login.Então mensagem de erro deve ser exibida