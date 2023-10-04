*** Settings ***
Library  Collections
Library  JSONLibrary
Library  JsonValidator
Library  OperatingSystem
Library  RequestsLibrary
Library  String
Library  ${EXECDIR}/resource/utils/generate_curl.py

# indexes api
Resource  ${EXECDIR}/resource/api/index_ambiente.resource

# utils
Resource  ${EXECDIR}/resource/utils/gherkin_ptbr.robot

# keywords helpers
Resource  ${EXECDIR}/resource/keywords/common/kws_shared.robot

# keywords
Resource  ${EXECDIR}/resource/keywords/api_gerar_pessoa/post_gerar_pessoa.robot