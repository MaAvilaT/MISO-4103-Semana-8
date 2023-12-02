Feature: Tags

  Background:
    Given user is logged in and is in tags page
      | username                           | password       |
      | admin@thesoftwaredesigncompany.com | Contraseña123# |


  Scenario: user creates a new tag from "internal tags tab"

    When user switches to internal tags and clicks on create new tag
    And user fills tag name, color and description
      | tag-name          | tag-color | description                                             |
      | tag-from-internal | 678978    | A test tag created with cypress from internal tags page |
    And clicks on save the new tag, returns to the internal tags page, switches back to public tags
    Then the new tag should be listed in the tags page
      | tag-name          | description                                             |
      | tag-from-internal | A test tag created with cypress from internal tags page |


  Scenario: user lists the existing tags

    When staying in the tags page
    Then there should be the following tags
      | tag-name          | description                                             |
      | tag-from-internal | A test tag created with cypress from internal tags page |


  Scenario: user creates two new tags one after another

    When user clicks on new tag
    And user fills tag name, color and description
      | tag-name      | tag-color | description   |
      | washington-dc | 978675    | My new tag-01 |
    And clicks on save the new tag, returns to the tags page
    And the new tag should be listed in the tags page
      | tag-name      | description   |
      | washington-dc | My new tag-01 |
    And user clicks on new tag
    And user fills tag name, color and description
      | tag-name | tag-color | description   |
      | beijing  | 456456    | My new tag-02 |
    And clicks on save the new tag, returns to the tags page
    Then the new tags should be listed in the tags page
      | tag-name      | description   |
      | washington-dc | My new tag-01 |
      | beijing       | My new tag-02 |


  Scenario: user edits two tags one after another

    When user click on edit a tag
      | tag-name      |
      | washington-dc |
    And changes the description of the tag, saves it, switches back to tags
      | tag-name      | edited-description   |
      | washington-dc | Edited new tag-01!!! |
    And user click on edit a tag
      | tag-name |
      | beijing  |
    And changes the description of the tag, saves it, switches back to tags
      | tag-name | edited-description |
      | beijing  | Tag 02 edited...   |
    Then the new tags should be listed in the tags page
      | tag-name      | description          |
      | washington-dc | Edited new tag-01!!! |
      | beijing       | Tag 02 edited...     |


  Scenario: user creates a three new tags, third tag is created after going to dashboard

    When user clicks on new tag
    And user fills tag name, color and description
      | tag-name         | tag-color | description                                |
      | computer-science | 978675    | Some good description for computer-science |
    And clicks on save the new tag, returns to the tags page
    And the new tag should be listed in the tags page
      | tag-name         | description                                |
      | computer-science | Some good description for computer-science |
    And user clicks on new tag
    And user fills tag name, color and description
      | tag-name            | tag-color | description                                   |
      | systems-engineering | 456456    | Some good description for systems-engineering |
    And clicks on save the new tag, returns to the tags page
    And the new tags should be listed in the tags page
      | tag-name            | description                                   |
      | computer-science    | Some good description for computer-science    |
      | systems-engineering | Some good description for systems-engineering |
    And user goes to dashboard page
    And user goes to tags page
    And user clicks on new tag
    And user fills tag name, color and description
      | tag-name             | tag-color | description                                    |
      | software-engineering | 355847    | Some good description for software-engineering |
    And clicks on save the new tag, returns to the tags page
    And the new tags should be listed in the tags page
      | tag-name             | description                                    |
      | computer-science     | Some good description for computer-science     |
      | systems-engineering  | Some good description for systems-engineering  |
      | software-engineering | Some good description for software-engineering |


  Scenario: user creates a four new tags, first tag is edited after second is created, third tag is created after going to dashboard

    When user clicks on new tag
    And user fills tag name, color and description
      | tag-name | tag-color | description                      |
      | halo-1   | 978675    | Some good description for halo-1 |
    And clicks on save the new tag, returns to the tags page
    And the new tag should be listed in the tags page
      | tag-name | description                      |
      | halo-1   | Some good description for halo-1 |
    And user clicks on new tag
    And user fills tag name, color and description
      | tag-name | tag-color | description                      |
      | halo-2   | 456456    | Some good description for halo-2 |
    And clicks on save the new tag, returns to the tags page
    And user click on edit a tag
      | tag-name |
      | halo-1   |
    And changes the description of the tag, saves it, switches back to tags
      | tag-name | edited-description  |
      | halo-1   | halo-1 01 edited... |
    And the new tags should be listed in the tags page
      | tag-name | description                      |
      | halo-1   | halo-1 01 edited...              |
      | halo-2   | Some good description for halo-2 |
    And user goes to dashboard page
    And user goes to tags page
    And user clicks on new tag
    And user fills tag name, color and description
      | tag-name | tag-color | description                      |
      | halo-3   | 355847    | Some good description for halo-3 |
    And clicks on save the new tag, returns to the tags page
    And user clicks on new tag
    And user fills tag name, color and description
      | tag-name | tag-color | description                      |
      | halo-4   | 348018    | Some good description for halo-4 |
    And clicks on save the new tag, returns to the tags page
    And the new tags should be listed in the tags page
      | tag-name | description                      |
      | halo-1   | halo-1 01 edited...              |
      | halo-2   | Some good description for halo-2 |
      | halo-3   | Some good description for halo-3 |
      | halo-4   | Some good description for halo-4 |


  Scenario: user attempts to create a tag with only numbers in its description

    When user clicks on new tag
    And user fills tag name, color and description
      | tag-name         | tag-color | description                                                       |
      | enochian-reading | 000000    | 62783923768906278392376890627839237689062783923768906278392376890 |
    Then clicks on save the new tag, returns to the tags page
    And the new tags should be listed in the tags page
      | tag-name         | tag-color | description                                                       |
      | enochian-reading | 000000    | 62783923768906278392376890627839237689062783923768906278392376890 |

  Scenario: user fills the data to create a tag and saves it after trying to navigate to dashboard

    When user clicks on new tag
    And user fills tag name, color and description
      | tag-name       | tag-color | description                                             |
      | beautiful-onyx | 000000    | Onyx is one of the greatest materials on this universe! |
    But user goes to dashboard page
    Then stay or leave dialog must appear
    And user clicks on stay button
    And clicks on save the new tag, returns to the tags page
    And the new tags should be listed in the tags page
      | tag-name       | description                                             |
      | beautiful-onyx | Onyx is one of the greatest materials on this universe! |

  Scenario: user deletes tags created in various different scenarios

    When deleting these tags
      | tag-name             | description                                                       |
      | tag-from-internal    | A test tag created with cypress from internal tags page           |
      | washington-dc        | Edited new tag-01!!!                                              |
      | beijing              | Tag 02 edited...                                                  |
      | computer-science     | Some good description for computer-science                        |
      | systems-engineering  | Some good description for systems-engineering                     |
      | software-engineering | Some good description for software-engineering                    |
      | halo-1               | Some good description for halo-1                                  |
      | halo-2               | halo-202 edited...                                                |
      | halo-3               | Some good description for halo-3                                  |
      | halo-4               | Some good description for halo-4                                  |
      | enochian-reading     | 62783923768906278392376890627839237689062783923768906278392376890 |
      | beautiful-onyx       | Onyx is one of the greatest materials on this universe!           |
    Then those tags should not be displayed in the tags page


  Scenario: user fills the data to create a tag but doesnt save it and goes to dashboard page

    When user clicks on new tag
    And user fills tag name, color and description
      | tag-name       | tag-color | description      |
      | volcanic ashes | 000000    | A volcanic stone |
    But user goes to dashboard page
    Then stay or leave dialog must appear
    And user clicks on leave button
    And user is now in dashboard page
