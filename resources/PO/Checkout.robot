*** Settings ***
Library     SeleniumLibrary
Library    FakerLibrary

*** Variables ***
${PAGE_TITLE}            xpath=//span[@class='title']
${CHECKOUT_BTN}          checkout
${CHECKOUT_FIRSTNAME}    id=first-name
${CHECKOUT_LASTNAME}     id=last-name
${CHECKOUT_POSTALCODE}   id=postal-code
${CONTINUE_BTN}          id=continue
${CHECKOUT_PRODUCT}      xpath=//div[contains(@class,'inventory_item_name')]
${CHECKOUT_PRICE}        xpath=//div[contains(@class,'summary_total_label')]
${FINISH_BTN}            id=finish

*** Keywords ***

E clico no botão "Checkout" 
    Click Button    ${CHECKOUT_BTN}

E sou redirecionada para o formulário "Your Information"
    Wait Until Element Is Visible    ${PAGE_TITLE}
    Capture Page Screenshot

E preencho o formulário com dados válidos
    ${first_name}     FakerLibrary.first_name
    Log               ${first_name}
    ${last_name}      FakerLibrary.last_name
    Log               ${last_name}
    ${postal_code}    FakerLibrary.zipcode
    Log               ${postal_code}
    Input Text        ${CHECKOUT_FIRSTNAME}      ${first_name}
    Input Text        ${CHECKOUT_LASTNAME}       ${last_name}
    Input Text        ${CHECKOUT_POSTALCODE}     ${postal_code}
    Capture Page Screenshot

E clico no botão "Continuar"
    Click Element          ${CONTINUE_BTN} 

Então sou redirecionada para a página "Overview"
    Page Should Contain    Checkout: Overview
    Capture Page Screenshot

Dado que estou na página "Overview"
    Então sou redirecionada para a página "Overview"

E verifico o produto no checkout
    Page Should Contain Element    ${CHECKOUT_PRODUCT}

E verifico o preço no checkout
    Page Should Contain Element    ${CHECKOUT_PRICE}
    
E clico no botão "Finish"
    Click Button    ${FINISH_BTN}

Então sou redirecionada para a finalização do checkout
    Page Should Contain    Checkout: Complete!
    Capture Page Screenshot

Dado que estou na página de finalização do checkout
    Então sou redirecionada para a finalização do checkout

Então a mensagem de confirmação de compra deve ser exibida
    Page Should Contain    Thank you for your order!
    Log                    Checkout Complete!
    Capture Page Screenshot
