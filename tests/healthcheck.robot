*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE_URL}    https://httpbin.org

*** Test Cases ***
Healthcheck GET
    Create Session    api    ${BASE_URL}    verify=${True}
    ${resp}=    GET On Session    api    /get
    Status Should Be    200    ${resp}
