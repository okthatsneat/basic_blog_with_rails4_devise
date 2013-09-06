Feature: Read article
  In order to consume the blog articles 
  A user
  Should be able to read any blog article

    Scenario: Logged out user is reading blog articles
      Given I am not logged in
        And There are articles on the blog
      When I visit the front page
      Then I can see all articles of the blog

      Scenario: Logged out user sees articles in decending order
        Given There are articles on the blog
      When I visit the front page
      Then I can see a date of creation on each article
        And I see that the article listed first is the latest one
