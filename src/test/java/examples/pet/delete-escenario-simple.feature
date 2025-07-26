Feature: Eliminar una mascota por ID usando DELETE /pet/{petId}

  Background:
    * url 'https://petstore3.swagger.io/api/v3'
    * def petId = 12

  Scenario: Validar que la respuesta tenga status 200 al eliminar la mascota
    Given path 'pet', petId
    When method delete
    Then status 200
