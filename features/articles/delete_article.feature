Feature: Delete article
  In order to delete a blog article
  A user
  Should be able to delete her or his articles only if logged in

    @javascript
    Scenario: Logged in user deletes her article successfully
      Given I am logged in
        And I successfully create an article 
        And I visit the front page
      Then I see a destroy link for that article
      When I click the destroy link on that article      
      When I confirm on the dialog popup asking me if I'm sure
      Then I do not see that article on the index page anymore
      

    Scenario: Logged in user cannot delete an article that does not belong to her
      Given I am logged in
        And I successfully create an article
      When I sign out
        And I sign up as another user
      Then I do not see the Delete link on that article 


    Scenario: Logged out user cannot delete any articles
      Given I am not logged in
        And I visit the front page
      Then I do not see any Delete links for articles   

