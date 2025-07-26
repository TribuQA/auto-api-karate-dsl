Feature: Validar creación de mascotas con datos parametrizados usando POST /pet

  Background:
    * url 'https://petstore3.swagger.io/api/v3'
    * def createRequest =
    """
    function(id, name, categoryId, categoryName, tagId, tagName, status) {
      return {
        id: id,
        name: name,
        category: {
          id: categoryId,
          name: categoryName
        },
        photoUrls: ["string"],
        tags: [
          {
            id: tagId,
            name: tagName
          }
        ],
        status: status
      };
    }
    """

  Scenario Outline: Validar que la respuesta tenga status 200 y solo el id
    * def requestBody = createRequest(<id>, <name>, <categoryId>, <categoryName>, <tagId>, <tagName>, <status>)
    Given path '/pet'
    And request requestBody
    When method post
    Then status 200
    And match response.id == <id>

    Examples:
      | id  | name     | categoryId | categoryName | tagId | tagName   | status     |
      | 101 | "doggie1"| 1          | "Dogs"       | 10    | "friendly"| "available"|
      | 102 | "kitty1" | 2          | "Cats"       | 20    | "lazy"    | "sold"     |

  Scenario Outline: Validar que la respuesta tenga status 200 y todo el body
    * def requestBody = createRequest(<id>, <name>, <categoryId>, <categoryName>, <tagId>, <tagName>, <status>)
    Given path '/pet'
    And request requestBody
    When method post
    Then status 200
    And match response ==
    """
    {
      id: <id>,
      name: <name>,
      category: {
        id: <categoryId>,
        name: <categoryName>
      },
      photoUrls: ["string"],
      tags: [
        {
          id: <tagId>,
          name: <tagName>
        }
      ],
      status: <status>
    }
    """

    Examples:
      | id  | name     | categoryId | categoryName | tagId | tagName  | status      |
      | 201 | "doggie2"| 1          | "Dogs"       | 11    | "calm"   | "available" |
      | 202 | "kitty2" | 2          | "Cats"       | 21    | "sleepy" | "pending"   |
