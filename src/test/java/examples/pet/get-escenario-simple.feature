Feature: Obtener una mascota por ID usando GET /pet/{petId}

  Background:
    * url 'https://petstore3.swagger.io/api/v3'
    * def petId = 10

  Scenario: Validar que la respuesta tenga status 200 y solo el id
    Given path 'pet', petId
    When method get
    Then status 200
    And match response.id == petId

  Scenario: Validar que la respuesta tenga status 200 y tipos de datos correctos usando expresiones embebidas
    Given path 'pet', petId
    When method get
    Then status 200
    And match response ==
    """
    {
      id: #number,
      name: #string,
      category: {
        id: #number,
        name: #string
      },
      photoUrls: [ #string ],
      tags: [ { id: #number, name: #string } ],
      status: #string
    }
    """
