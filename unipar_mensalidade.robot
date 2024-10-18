*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${input_cpf}            id:username
${input_password}       id:password
${button_input}         id:button-login
${button_financeiro}    //*[@id="ion-side-menu"]/menu-left/ion-content/div[1]/ion-list/div/div[4]/div/ion-item[6]/a[1]
${button_cobrancas}     //*[@id="ion-side-menu"]/menu-left/ion-content/div[1]/ion-list/div/div[4]/div/ion-item[6]/div[1]/a
${button_conta}         //*[@id="listarContent"]/div/div[4]/pagtocobrancas-component/div/div/div[3]/div/div[3]/div/div[1]/label/input
${button_pix}           //button[@ng-show="vm.mostrarPix()"]
${button_copiar}        id=copy-button

*** Keywords ***
abrir google e entrar no site    
    Open Browser    https://lyaluno.unipar.br/aluno/#/login    chrome
preencher form
    Input Text    ${input_cpf}    #input your cpf here
    Input Password    ${input_password}    #input your password here

clicar em login
    Click Element    ${button_input}
    Wait Until Element Is Enabled    ${button_financeiro}

clicar nas financias
    Click Element    ${button_financeiro}
cobrancas
    Click Element    ${button_cobrancas}
    Sleep    1
    Click Element    ${button_conta}
entra no codigo pix
    Scroll Element Into View    ${button_pix}
    Click Element    ${button_pix}
    Sleep    1
copiar codigo pix
    Scroll Element Into View    ${button_copiar}
    Click Element    ${button_copiar}

*** Test Cases ***
Cenario 1:Entrar no site da unipar
    abrir google e entrar no site  
    Maximize Browser Window
    preencher form    
    clicar em login
    clicar nas financias 
    cobrancas
    entra no codigo pix
    copiar codigo pix
