*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    chrome
${URL}    http://www.amazon.com.br
${MENU_LIVROS}    //a[@data-csa-c-slot-id='nav_cs_5']
${HEADER_LIVROS}    //h2[contains(.,'Loja de Livros')]
${TEXTO_HEADER_LIVROS}    Loja de Livros

*** Keywords ***
Abrir o navegador
    Open Browser    browser=${BROWSER}
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Acessar a home page do site Amazon.com.br
    Go To    url=${URL} 
    Wait Until Element Is Visible    locator=${MENU_LIVROS}   

Entrar no menu "Livros"
    Click Element    locator=${MENU_LIVROS}

Verificar se aparece a frase "Loja de Livros"
    Wait Until Page Contains    text=${TEXTO_HEADER_LIVROS}     
    Wait Until Element Is Visible    locator=${HEADER_LIVROS}

Verificar se o título da página fica "${TITULO}" 
    Title Should Be    title=${TITULO}

Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible   locator=//img[@alt='${NOME_CATEGORIA}']


Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Input Text    locator=field-keywords  text=${PRODUTO} 

Clicar no botão de pesquisa
    Click Element    locator=nav-search-submit-button 

Verificar o resultado da pesquisa, listando o produto "${PRODUTO}"
    Wait Until Element Is Visible    locator=(//span[contains(.,'${PRODUTO}')])[3]

Adicionar o produto "${PRODUTO}" no carrinho    
    Click Element    locator=//img[@alt='${PRODUTO}']
    Wait Until Element Is Visible    locator=//span[@class='a-size-large product-title-word-break'][contains(.,'${PRODUTO}')]
    Click Element    locator=//input[@name='submit.add-to-cart']

Verificar se o produto "${PRODUTO}" foi adicionado com sucesso  
    Click Element    locator=//span[@aria-hidden='true'][contains(.,'Carrinho')]
    Wait Until Element Is Visible    locator=//h1[contains(.,'Carrinho de compras')]
    Element Should Be Visible    locator=//span[@class='a-truncate-cut'][contains(.,'${PRODUTO}')]


Remover o produto "${PRODUTO}" do carrinho
    Click Element    locator=//input[@value='Excluir']


Verificar se o carrinho fica vazio  
    Wait Until Element Is Visible    locator=//h1[contains(.,'Seu carrinho de compras da Amazon está vazio.')]
    


# GHERKIN STEPS
Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br
    Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."

Quando acessar o menu "Livros"
    Entrar no menu "Livros"

Então o título da página deve ficar "Livros | Amazon.com.br"
    Verificar se o título da página fica "Livros | Amazon.com.br"    


E o texto "Loja de Livros" deve ser exibido na página
    Verificar se aparece a frase "Loja de Livros"

E a categoria "Mais vendidos" deve ser exibida na página
    Verificar se aparece a categoria "Mais vendidos"


Quando pesquisar pelo produto "Xbox Series S"
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa   

Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    Verificar se o título da página fica "Amazon.com.br : Xbox Series S"       

E um produto da linha "Xbox Series S" deve ser mostrado na página
    Verificar o resultado da pesquisa, listando o produto "Console Xbox Series S"    

Quando adicionar o produto "Xbox Series S" no carrinho
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa, listando o produto "Xbox Series S"
    Adicionar o produto "Xbox Series S" no carrinho

Então o produto "Xbox Series S" deve ser mostrado no carrinho
    Verificar se o produto "Xbox Series S" foi adicionado com sucesso

E existe o produto "Xbox Series S" no carrinho
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa, listando o produto "Xbox Series S"
    Adicionar o produto "Xbox Series S" no carrinho
    Verificar se o produto "Xbox Series S" foi adicionado com sucesso

Quando remover o produto "Xbox Series S" do carrinho
    Remover o produto "Xbox Series S" do carrinho

Então o carrinho deve ficar vazio
    Verificar se o carrinho fica vazio