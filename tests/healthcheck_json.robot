*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${BASE_URL}    https://httpbin.org

*** Test Cases ***
Deve validar estrutura do JSON do GET
    Create Session    api    ${BASE_URL}    verify=${True}

    ${resp}=    GET On Session    api    /get
    Status Should Be    200    ${resp}

    # Converte a resposta para um JSON
    ${json}=    Set Variable    ${resp.json()}

    #Valida chaves principais
    Dictionary Should Contain Key    ${json}    url
    Dictionary Should Contain Key    ${json}    headers
    Dictionary Should Contain Key    ${json}    origin
    Dictionary Should Contain Key    ${json}    args

    #Validar valores específicos
    Should Be Equal     ${json["url"]}    ${BASE_URL}/get

