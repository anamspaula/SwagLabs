*** Settings ***
Resource         ../resources/PO/Login.robot
Resource         ../resources/PO/Checkout.robot
Resource         ../resources/Resource.robot
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
    Products.Dado que estou na página "Products"
    Products.E insiro um produto no carrinho
    Products.Então o botão "Remove" é exibido
    Products.E verifico o produto no carrinho

Caso de Teste 03 - Iniciar o checkout
    [Documentation]    Esse teste verifica se o checkout é realizado conforme o esperado
    [Tags]             checkout
    Products.Dado que estou na página "Cart"
    Checkout.E clico no botão "Checkout"
    Checkout.E sou redirecionada para o formulário "Your Information"
    Checkout.E preencho o formulário com dados válidos 
    Checkout.E clico no botão "Continuar"
    Checkout.Então sou redirecionada para a página "Overview"

Caso de Teste 04 - Verifico se o produto está no checkout
    [Documentation]    Esse teste verifica se o checkout é realizado conforme o esperado
    [Tags]             checkout_overview
    Checkout.Dado que estou na página "Overview"
    Checkout.E verifico o produto no checkout
    Checkout.E verifico o preço no checkout
    Checkout.E clico no botão "Finish"
    Checkout.Então sou redirecionada para a finalização do checkout

Caso de Teste 05 - Compra concluída
    [Documentation]    Esse teste verifica se a compra é concluída corretamente
    [Tags]             checkout_complete
    Checkout.Dado que estou na página de finalização do checkout
    Checkout.Então a mensagem de confirmação de compra deve ser exibida

