*** Settings ***
Resource  ${EXECDIR}/resource/main.resource

*** Keywords ***
Retorna curl da chamada
    [Documentation]  Keyword responsável por gerar um curl da requisição.
    ${response_curl}  geraCurl  ${response}
    Log   ${response_curl}
    [Return]  ${response_curl}