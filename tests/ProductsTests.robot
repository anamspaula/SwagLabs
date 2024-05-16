*** Settings ***
Resource         ../resources/Resource.robot
Resource         ../resources/PO/Login.robot
Resource         ../resources/PO/Products.robot
Suite Setup       Abrir Navegador
Suite Teardown    Fechar Navegador

*** Test Cases ***
Caso de Teste 01 - Realizar Login
    [Documentation]    Esse teste verifica se o login está ocorrendo conforme o esperado
    [Tags]             login
    Login.Dado que estou na página de Login
    Login.E insiro um username válido    standard_user 
    Login.E insiro uma senha válida      secret_sauce
    Login.E clico no botão "Login"
    Login.Então sou redirecionado para a página de produtos

Caso de Teste 02 - Adicionar produto no carrinho
    [Documentation]    Esse teste verifica se ao clicar em "Add to cart" o produto está sendo inserido no carrinho
    [Tags]             add_cart
    Products.Dado que estou na página de produtos
    Products.E insiro um produto no carrinho
    Products.Então o botão "Remove" é exibido
    Products.E verifico o produto no carrinho