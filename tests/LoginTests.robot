*** Settings ***
Resource         ../resources/Resource.robot
Resource         ../resources/PO/Login.robot
Test Setup       Abrir Navegador
Test Teardown    Fechar Navegador

*** Test Cases ***

Caso de Teste 01 - Credenciais Válidas
    [Documentation]    Esse teste verifica se o login está ocorrendo sem nenhuma não conformidade ao se utilizar credenciais Válidas
    [Tags]             Login_valido
    Dado que estou na página de Login
    E insiro credenciais válidas    standard_user    secret_sauce
    E clico no botão "Login"
    Então sou redirecionado para a página de produtos


