Feature: Create article
  In order to publish a blog article
    A user
    Should be able to create an article if logged in 

      Scenario: Logged in in user creates article successfully
        Given I exist as a user
          And I am not logged in
        When I sign in with valid credentials
        Then I see a new article link
        When I follow the new article link
        Then I should see the new article form
        When I fill in "title" with "some title"
        And I fill in "body" with "some body" 
        And I click submit on the new article form 
        Then I should see a page with "some title" and "some body" on it

        Scenario: Logged out user cannot create an article 
        Given I am not logged in
        Then I do not see a new article link