*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${input_cpf}            id:username
${input_password}       id:password
${button_input}         id:button-login
${button_invoices}    //*[@id="ion-side-menu"]/menu-left/ion-content/div[1]/ion-list/div/div[4]/div/ion-item[6]/a[1]
${button_payment}     //*[@id="ion-side-menu"]/menu-left/ion-content/div[1]/ion-list/div/div[4]/div/ion-item[6]/div[1]/a
${button_account}         //*[@id="listarContent"]/div/div[4]/pagtocobrancas-component/div/div/div[3]/div/div[3]/div/div[1]/label/input
${button_pix}           //button[@ng-show="vm.mostrarPix()"]
${button_copy}        id=copy-button

*** Keywords ***
open unipar website    
    Open Browser    https://lyaluno.unipar.br/aluno/#/login    chrome

login
    Maximize Browser Window
    Input Text    ${input_cpf}    #input your cpf here
    Input Password    ${input_password}    #input your password here
    Click Element    ${button_input}
    Wait Until Element Is Enabled    ${button_invoices}

invoices tab
    Click Element    ${button_invoices}
    Click Element    ${button_payment}
    Sleep    1
    Click Element    ${button_account}

open pix code
    Scroll Element Into View    ${button_pix}
    Click Element    ${button_pix}
    Sleep    1

copy qrcode
    Scroll Element Into View    ${button_copy}
    Click Element    ${button_copy}

*** Test Cases ***
Cenario 1:main
    open unipar website  
    login
    invoices tab
    open pix code
    copy qrcode
