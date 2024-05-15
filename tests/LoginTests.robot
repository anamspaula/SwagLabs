*** Settings ***
Resource         ../resources/Resource.robot
Resource         ../resources/PO/Login.robot
Test Setup       Abrir Navegador
Test Teardown    Fechar Navegador

*** Test Cases ***

Caso de Teste 01 - Credenciais Válidas
    [Documentation]    Esse teste valida se o login está ocorrendo conforme o esperado ao utilizar credenciais Válidas
    [Tags]             Login_valido
    Dado que estou na página de Login
    E insiro um username válido    standard_user 
    E insiro uma senha válida      secret_sauce
    E clico no botão "Login"
    Então sou redirecionado para a página de produtos

Caso de Teste 02 - Username Inválido
    [Documentation]    Esse teste valida se é apresentado erro ao tentar logar com username Inválido
    [Tags]    username_invalido
    Dado que estou na página de Login
    E insiro um username inválido
    E insiro uma senha válida    secret_sauce
    E clico no botão "Login"
    Então mensagem de erro deve ser exibida

