Feature: Actualizar una mascota usando PUT /pet

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

  Scenario: Validar que la respuesta tenga status 200 y solo el id
    Given path '/pet'
    And request requestBody
    When method put
    Then status 200
    And match response.id == 10

  Scenario: Validar que la respuesta tenga status 200 y todo el body
    Given path '/pet'
    And request requestBody
    When method put
    Then status 200
    And match response ==
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
