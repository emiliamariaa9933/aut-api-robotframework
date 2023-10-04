*** Settings ***
Resource  ${EXECDIR}/resource/main.resource

*** Keywords ***
faço uma parametrização válida para enviar ao endpoint gerar_pessoa
  [Documentation]  Keyword responsável por parametrizar as informações a serem enviadas na requisição ao endpoint "gerar_pessoa".
  ${headers}    Create Dictionary    Content-Type=application/x-www-form-urlencoded
  Set Suite Variable  ${headers} 
  ${data}  Create Dictionary  acao=gerar_pessoa  pontuacao=N  sexo=H  txt_qtde=1
  Set Suite Variable  ${data}

faço uma parametrização válida para enviar ao endpoint validar_cpf
  [Documentation]  Keyword responsável por parametrizar as informações a serem enviadas na requisição ao endpoint "validar_cpf".
  ${data}  Create Dictionary  acao=validar_cpf  txt_cpf=${CPF}
  Set Test Variable  ${data}

faço a requisição POST
  [Documentation]  Keyword responsável por fazer a requisição POST no endpoint.
  ${response}  POST  ${AMBIENTE.url_base}
  ...  expected_status=any
  ...  headers=${headers}
  ...  data=${data}
  Set Suite Variable  ${response}
  Set Suite Variable  ${contrato_api}  ${response.text}

a idade deve ser retornada na resposta da requisição
  [Documentation]  Keyword responsável por validar a presença do campo idade na resposta da requisição.
  Dictionary Should Contain Key  ${response.json()[0]}  idade

deve retornar o valor "${valor_sexo}" no campo sexo
  [Documentation]  Keyword responsável por converter a validar o valor "Masculino" no campo "sexo" do ResponseBody.
  ${response_sexo}  Convert To String  ${response.json()[0]["sexo"]}
  Should Be Equal As Strings  ${valor_sexo}  ${response_sexo}

deve retornar o valor armazenado da variável CPF
  [Documentation]  Keyword responsável por converter o cpf obtido na requisição para string, armazená-lo em uma variável global e validar se foi salvo corretamente.
  ${CPF}  Convert To String  ${response.json()[0]["cpf"]}
  Set Global Variable  ${CPF}
  Should Be Equal As Strings  ${CPF}  ${response.json()[0]["cpf"]}

deve apresentar a mensagem indicando que o cpf é verdadeiro
  [Documentation]  Keyword responsável por validar a mensagem de cpf válido.
  Should Be Equal As Strings  ${CPF} - Verdadeiro  ${contrato_api}

deve retornar o valor da variável CPF vazio
  [Documentation]  Keyword responsável por limpar o valor da variável CPF e depois validar se está vazio.
  ${CPF}  Replace Variables  ${EMPTY}
  Should Be Empty  ${CPF}