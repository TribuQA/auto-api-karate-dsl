@custom
Feature: Validar creación de mascotas usando POST /pet

  Background:
    * url baseUrl
    * def requestBody = read('classpath:examples/pet/data/request-body.json')
    * def dynamicId = Math.floor(Math.random() * 100) + 1

  @custom1
  Scenario: Validar que la respuesta tenga status 200 y contenga solo el id
    * set requestBody.id = dynamicId
    Given path '/pet'
    And request requestBody
    When method post
    Then status 200
    And match response.id == dynamicId
    * print 'Respuesta:', response

  @custom2
  Scenario: Validar que la respuesta tenga status 200 y coincida con todo el body esperado
    * set requestBody.id = dynamicId
    Given path '/pet'
    And request requestBody
    When method post
    Then status 200
    * def expectedResponse = JSON.parse(JSON.stringify(requestBody))
    And match response == expectedResponse
    * print 'Respuesta:', response
