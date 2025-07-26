Feature: Pruebas negativas al obtener una mascota con GET /pet/{petId}

  Background:
    * url 'https://petstore3.swagger.io/api/v3'

  Scenario: Validar que se obtenga status 404 al consultar una mascota inexistente
    # Usamos un ID que no debería existir
    * def petId = 00
    Given path 'pet', petId
    When method get
    Then status 404

  Scenario: Validar que se obtenga status 400 al usar un petId inválido
    # Usamos un valor no numérico
    * def petId = 'invalid-id'
    Given path 'pet', petId
    When method get
    Then status 400
