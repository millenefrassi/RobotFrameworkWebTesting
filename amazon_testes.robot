*** Settings ***
Documentation      Essa suite testa o site da Amazon.com.br
Resource           amazon_resources.robot
Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador


*** Test Cases ***
Caso de Teste 01 - Acesso ao menu Livros
    [Documentation]    Esse teste verifica o menu livros do site da Amazon.co..br
    ...                e verifica a categoria Mais vendidos 
    [Tags]             menus  categorias                              
    Acessar a home page do site Amazon.com.br
    Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."
    Entrar no menu "Livros"
    Verificar se aparece a frase "Loja de Livros"
    Verificar se o título da página fica "Livros | Amazon.com.br"
    Verificar se aparece a categoria "Mais vendidos"
    Verificar se aparece a categoria "Indicações"

Caso de Teste 02 - Pesquisa de um Produto
    [Documentation]    Esse teste verifica a busca de um produto
    [Tags]             busca_produtos  lista_busca
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa, listando o produto "Console Xbox Series S"


Caso de Teste 03 - Adicionar Produto no Carrinho
    [Documentation]    Esse teste verifica a adição de um produto no carrinho de compras
    [Tags]             adicionar_carrinho
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa, listando o produto "Xbox Series S"
    Adicionar o produto "Xbox Series S" no carrinho
    Verificar se o produto "Xbox Series S" foi adicionado com sucesso

Caso de Teste 04 - Remover Produto do Carrinho
    [Documentation]    Esse teste verifica a remoção de um produto no carrinho de compras
    [Tags]             remover_carrinho
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa, listando o produto "Xbox Series S"
    Adicionar o produto "Xbox Series S" no carrinho
    Verificar se o produto "Xbox Series S" foi adicionado com sucesso
    Remover o produto "Xbox Series S" do carrinho
    Verificar se o carrinho fica vazio       