*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${IVENTORY_TITLE}             xpath=//span[@class='title'][contains(.,'Products')]
${IVENTORY_BTN_CART}          add-to-cart-sauce-labs-backpack
${IVENTORY_BTN_REMOVE}        remove-sauce-labs-backpack
${IVENTORY_MINICART}          xpath=//a[@class='shopping_cart_link'][contains(.,'1')]
${CART_PRODUCT}               xpath=//div[contains(@class,'inventory_item_name')]

*** Keywords ***
Dado que estou na página de produtos
    Wait Until Element Is Visible    ${IVENTORY_TITLE}

E insiro um produto no carrinho
    Click Button    ${IVENTORY_BTN_CART}

Então o botão "Remove" é exibido
    Wait Until Element Is Visible    ${IVENTORY_BTN_REMOVE}
    Capture Page Screenshot

E verifico o produto no carrinho
    Click Element                    ${IVENTORY_MINICART}
    Wait Until Element Is Visible    ${CART_PRODUCT} 
    Log                              Produto adicionado ao carrinho com sucesso!  
    Capture Page Screenshot 
    
    