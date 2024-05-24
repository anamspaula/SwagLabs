*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    headlessfirefox
${URL}        https://www.google.com/

*** Keywords ***
Abrir Navegador
    Open Browser    ${URL}    ${BROWSER}

Fechar Navegador
    Close Browser