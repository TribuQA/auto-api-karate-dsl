@full
Feature: Validar creación de mascotas usando POST /pet

  Background:
    * url 'https://petstore3.swagger.io/api/v3'
    * def requestBody =
      """
      {
        "id": 10,
        "name": "doggie",
        "category": {
          "id": 1,
          "name": "Dogs"
        },
        "photoUrls": [
          "string"
        ],
        "tags": [
          {
            "id": 0,
            "name": "string"
          }
        ],
        "status": "available"
      }
      """

  @escenario-id
  Scenario: Validar que la respuesta tenga status 200 y contenga solo el id
    Given path '/pet'
    And request requestBody
    When method post
    Then status 200
    And match response.id == 10

  @escenario-body
  Scenario: Validar que la respuesta tenga status 200 y coincida con todo el body esperado
    Given path '/pet'
    And request requestBody
    When method post
    Then status 200
    And match response ==
      """
      {
        "id": 10,
        "category": {
          "id": 1,
          "name": "Dogs"
        },
        "name": "doggie",
        "photoUrls": [
          "string"
        ],
        "tags": [
          {
            "id": 0,
            "name": "string"
          }
        ],
        "status": "available"
      }
      """
