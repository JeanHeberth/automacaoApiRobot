*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${BASE_URL}    https://httpbin.org

*** Test Cases ***
Deve retornar query params enviados
    Create Session    api    ${BASE_URL}    verify=${True}
    ${params}=  Create Dictionary   nome=jean   curso=robot
    ${resp}=    GET On Session    api    /get   params=${params}
    Status Should Be    200     ${resp}

    ${json}=    Set Variable    ${resp.json()}
    Dictionary Should Contain Key    ${json}      args
    Should Be Equal    ${json["args"]["nome"]}    jean
    Should Be Equal    ${json["args"]["curso"]}   robot

