*** Settings ***
Resource  ${EXECDIR}/resource/main.resource

*** Keywords ***
deve retornar o status code "${status_code}"
  [Documentation]  Keyword responsável por validar o status code mediante exigência do teste.
  Status Should Be  ${status_code}