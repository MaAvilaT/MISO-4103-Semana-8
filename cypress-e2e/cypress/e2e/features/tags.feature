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
      | tag-name   | tag-color | description   |
      | new-tag-01 | 978675    | My new tag-01 |
    And clicks on save the new tag, returns to the tags page
    And the new tag should be listed in the tags page
      | tag-name   | description   |
      | new-tag-01 | My new tag-01 |
    And user clicks on new tag
    And user fills tag name, color and description
      | tag-name   | tag-color | description   |
      | new-tag-02 | 456456    | My new tag-02 |
    And clicks on save the new tag, returns to the tags page
    Then the new tags should be listed in the tags page
      | tag-name   | description   |
      | new-tag-01 | My new tag-01 |
      | new-tag-02 | My new tag-02 |


  Scenario: user edits two tags one after another

    When user click on edit a tag
      | tag-name   |
      | new-tag-01 |
    And changes the description of the tag, saves it, switches back to tags
      | tag-name   | edited-description   |
      | new-tag-01 | Edited new tag-01!!! |
    And user click on edit a tag
      | tag-name   |
      | new-tag-02 |
    And changes the description of the tag, saves it, switches back to tags
      | tag-name   | edited-description |
      | new-tag-02 | Tag 02 edited...   |
    Then the new tags should be listed in the tags page
      | tag-name   | description          |
      | new-tag-01 | Edited new tag-01!!! |
      | new-tag-02 | Tag 02 edited...     |


  Scenario: user creates a three new tags, third tag is created after going to dashboard

    When user clicks on new tag
    And user fills tag name, color and description
      | tag-name  | tag-color | description                         |
      | ttt-gs-01 | 978675    | Some good description for ttt-gs-01 |
    And clicks on save the new tag, returns to the tags page
    And the new tag should be listed in the tags page
      | tag-name  | description                         |
      | ttt-gs-01 | Some good description for ttt-gs-01 |
    And user clicks on new tag
    And user fills tag name, color and description
      | tag-name  | tag-color | description                         |
      | ttt-gs-02 | 456456    | Some good description for ttt-gs-02 |
    And clicks on save the new tag, returns to the tags page
    And the new tags should be listed in the tags page
      | tag-name  | description                         |
      | ttt-gs-01 | Some good description for ttt-gs-01 |
      | ttt-gs-02 | Some good description for ttt-gs-02 |
    And user goes to dashboard page
    And user goes to tags page
    And user clicks on new tag
    And user fills tag name, color and description
      | tag-name  | tag-color | description                         |
      | ttt-gs-03 | 355847    | Some good description for ttt-gs-03 |
    And clicks on save the new tag, returns to the tags page
    And the new tags should be listed in the tags page
      | tag-name  | description                         |
      | ttt-gs-01 | Some good description for ttt-gs-01 |
      | ttt-gs-02 | Some good description for ttt-gs-02 |
      | ttt-gs-03 | Some good description for ttt-gs-03 |


  Scenario: user creates a four new tags, first tag is edited after second is created, third tag is created after going to dashboard

    When user clicks on new tag
    And user fills tag name, color and description
      | tag-name  | tag-color | description                         |
      | ftt-gs-01 | 978675    | Some good description for ftt-gs-01 |
    And clicks on save the new tag, returns to the tags page
    And the new tag should be listed in the tags page
      | tag-name  | description                         |
      | ftt-gs-01 | Some good description for ftt-gs-01 |
    And user clicks on new tag
    And user fills tag name, color and description
      | tag-name  | tag-color | description                         |
      | ftt-gs-02 | 456456    | Some good description for ftt-gs-02 |
    And clicks on save the new tag, returns to the tags page
    And user click on edit a tag
      | tag-name  |
      | ftt-gs-01 |
    And changes the description of the tag, saves it, switches back to tags
      | tag-name  | edited-description     |
      | ftt-gs-01 | ftt-gs-01 01 edited... |
    And the new tags should be listed in the tags page
      | tag-name  | description                         |
      | ftt-gs-01 | ftt-gs-01 01 edited...              |
      | ftt-gs-02 | Some good description for ftt-gs-02 |
    And user goes to dashboard page
    And user goes to tags page
    And user clicks on new tag
    And user fills tag name, color and description
      | tag-name  | tag-color | description                         |
      | ftt-gs-03 | 355847    | Some good description for ftt-gs-03 |
    And clicks on save the new tag, returns to the tags page
    And user clicks on new tag
    And user fills tag name, color and description
      | tag-name  | tag-color | description                         |
      | ftt-gs-04 | 348018    | Some good description for ftt-gs-04 |
    And clicks on save the new tag, returns to the tags page
    And the new tags should be listed in the tags page
      | tag-name  | description                         |
      | ftt-gs-01 | ftt-gs-01 01 edited...              |
      | ftt-gs-02 | Some good description for ftt-gs-02 |
      | ftt-gs-03 | Some good description for ftt-gs-03 |
      | ftt-gs-04 | Some good description for ftt-gs-04 |


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
      | tag-name          | description                                                       |
      | tag-from-internal | A test tag created with cypress from internal tags page           |
      | new-tag-01        | Edited new tag-01!!!                                              |
      | new-tag-02        | Tag 02 edited...                                                  |
      | ttt-gs-01         | Some good description for ttt-gs-01                               |
      | ttt-gs-02         | Some good description for ttt-gs-02                               |
      | ttt-gs-03         | Some good description for ttt-gs-03                               |
      | ftt-gs-01         | Some good description for ftt-gs-01                               |
      | ftt-gs-02         | ftt-gs-0202 edited...                                             |
      | ftt-gs-03         | Some good description for ftt-gs-03                               |
      | ftt-gs-04         | Some good description for ftt-gs-04                               |
      | enochian-reading  | 62783923768906278392376890627839237689062783923768906278392376890 |
      | beautiful-onyx    | Onyx is one of the greatest materials on this universe!           |
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
