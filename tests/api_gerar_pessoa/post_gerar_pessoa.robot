*** Settings ***
Resource  ${EXECDIR}/resource/main.resource

*** Test Cases ***
TC0001: Retornar status 200 ao fazer requisição POST na api
    [Tags]  TC0001
    [Documentation]  Teste responsável por validar o status code retornado. Com uma requsição válida na api,
    ...              deve retornar 200.
    Dado que faço uma parametrização válida para enviar ao endpoint gerar_pessoa
    Quando faço a requisição POST
    Então deve retornar o status code "200"

TC0002: Retornar o campo idade no ResponseBody
    [Tags]  TC0002
    [Documentation]  Teste responsável por realizar uma requisição POST na api e verificar se o campo idade é retornado no ResponseBody.
    Dado que faço uma parametrização válida para enviar ao endpoint gerar_pessoa
    Quando faço a requisição POST
    Então a idade deve ser retornada na resposta da requisição

TC0003: Retornar o valor do campo sexo igual a Masculino no ResponseBody
    [Tags]  TC0003
    [Documentation]  Teste responsável por realizar uma requisição POST na api e verificar se o campo sexo retorna o valor Masculino.
    Dado que faço uma parametrização válida para enviar ao endpoint gerar_pessoa
    Quando faço a requisição POST
    Então deve retornar o valor "Masculino" no campo sexo

TC0004: Retornar o valor do campo sexo igual a Feminino no ResponseBody
    [Tags]  TC0004
    [Documentation]  Teste responsável por realizar uma requisição POST na api e verificar se o campo sexo retorna o valor Feminino.
    Dado que faço uma parametrização válida para enviar ao endpoint gerar_pessoa
    Quando faço a requisição POST
    Então deve retornar o valor "Feminino" no campo sexo

TC0005: Armazenar o campo CPF do ResponseBody em uma variável
    [Tags]  TC0005
    [Documentation]  Teste responsável por armazenar o valor do campo CPF do ResponseBody em uma variável chamada CPF.
    Dado que faço uma parametrização válida para enviar ao endpoint gerar_pessoa
    Quando faço a requisição POST
    Então deve retornar o valor armazenado da variável CPF

TC0006: Validar se o CPF é válido
    [Tags]  TC0006
    [Documentation]  Teste responsável por validar se o CPF é válido. Passando o parâmetro do CPF armazenado, deve retornar cpf verdadeiro
    Dado que faço uma parametrização válida para enviar ao endpoint validar_cpf
    Quando faço a requisição POST
    Então deve apresentar a mensagem indicando que o cpf é verdadeiro

TC0007: Limpar a variável CPF
    [Tags]  TC0007
    [Documentation]  Teste responsável por limpar a variável CPF armazenada.
    Dado que faço uma parametrização válida para enviar ao endpoint gerar_pessoa
    Quando faço a requisição POST
    Então deve retornar o valor da variável CPF vazio