*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${PAGE_TITLE}                 xpath=//span[@class='title']
${IVENTORY_BTN_CART}          add-to-cart-sauce-labs-backpack
${IVENTORY_BTN_REMOVE}        remove-sauce-labs-backpack
${IVENTORY_BTN_SHOPPING}      continue-shopping
${IVENTORY_BADGE}             xpath=//span[contains(@class,'badge')]
${IVENTORY_MINICART}          xpath=//a[@class='shopping_cart_link'][contains(.,'1')]
${IVENTORY_PRODUCT}           xpath=//div[contains(@class,'inventory_item_name')]

*** Keywords ***
Dado que estou na página "Products"
    Wait Until Element Is Visible    ${PAGE_TITLE}

E insiro um produto no carrinho
    Click Button    ${IVENTORY_BTN_CART}

Então o botão "Remove" é exibido
    Wait Until Element Is Visible    ${IVENTORY_BTN_REMOVE}
    Capture Page Screenshot

E verifico o produto no carrinho
    Click Element                    ${IVENTORY_MINICART}
    Wait Until Element Is Visible    ${IVENTORY_PRODUCT} 
    Log                              Produto adicionado ao carrinho com sucesso!  
    Capture Page Screenshot 

Dado que estou na página "Cart"
    Wait Until Element Is Visible    ${PAGE_TITLE}

E clico no botão "Remove"
    Click Button    ${IVENTORY_BTN_REMOVE}

Então o produto é removido do carrinho
    Wait Until Element Is Not Visible    ${IVENTORY_BTN_REMOVE}
    Wait Until Element Is Not Visible    ${IVENTORY_BADGE}
    Log                                  Produto removido com sucesso!
    Capture Page Screenshot

E clico no botão "Continue Shopping"
    Click Button    ${IVENTORY_BTN_SHOPPING}

E volto para a página "Products"
    Dado que estou na página "Products"