Feature: Update article
  In order to update a blog article
  A user
  Should be able to update only her or his articles and only if logged in

    Scenario: Logged in user updates her article successfully
      Given I am logged in
        And I successfully create an article 
        And I visit the front page
      Then I see an edit link for that article
      When I click the edit link on that article     
      Then I see the edit form for that article
      When I fill in "title" with "updated_title"
        And I fill in "body" with "updated_body"
        And I submit the form
      Then I should see a page with "updated_title" and "updated_body" on it
      

    Scenario: Logged in user cannot update an article that does not belong to her
      Given I am logged in
        And I successfully create an article
      When I sign out
        And I sign up as another user
      Then I do not see the edit link on that article 


    Scenario: Logged out user cannot update any articles
      Given I am not logged in
        And I visit the front page
      Then I do not see any edit links for articles   

