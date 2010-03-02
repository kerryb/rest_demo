Feature: REST interface

  Background:
    Given the following products exist:
      | code | description        | price |
      | a001 | Left-handed widget | 1.23  |
      | a002 | Tartan paint       | 3.50  |

  Scenario: Viewing products
    When I go to the home page
    And I follow the "products" link
    Then the response status should be "200 OK"
    And the response content type should be "application/vnd.rest-example.products+xml"
    And the response should be an XML document matching:
      | xpath                            | value              |
      | /products/product[1]/code        | a001               |
      | /products/product[1]/description | Left-handed widget |
      | /products/product[1]/price       | £1.23              |
      | /products/product[2]/code        | a002               |
      | /products/product[2]/description | Tartan paint       |
      | /products/product[2]/price       | £3.50              |
    When I follow the first "view" link
    Then the response status should be "200 OK"
    And the response content type should be "application/vnd.rest-example.product+xml"
    And the response should be an XML document matching:
      | xpath                | value              |
      | /product/code        | a001               |
      | /product/description | Left-handed widget |
      | /product/price       | £1.23              |

  Scenario: Creating and placing an order
    When I go to the home page
    And I follow the "orders" link
    Then the response status should be "200 OK"
    And the response content type should be "application/vnd.rest-example.orders+xml"
