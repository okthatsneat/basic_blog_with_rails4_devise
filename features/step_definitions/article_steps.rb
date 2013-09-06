TEST_ARTICLES_COUNT = 20

### GIVEN ###
Given(/^I successfully create an article$/) do
  @article = FactoryGirl.build(:article, :user => @user)
  @article.save
end

Given(/^I visit the front page$/) do
  visit root_path
end

Given(/^There are articles on the blog$/) do
  created_articles = FactoryGirl.create_list(:article, TEST_ARTICLES_COUNT)
end

### WHEN ###

When(/^I follow the new article link$/) do
  visit new_article_path
end

When(/^I click submit on the new article form$/) do
  click_button "Create Article"
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |field, content|
  fill_in "article_#{field}", :with => content
end

When(/^I click the destroy link on that article$/) do
  click_link "Destroy", :href=>"/articles/#{@article.id}"
end

When(/^I confirm on the dialog popup asking me if I'm sure$/) do
  page.driver.browser.switch_to.alert.accept
end

When(/^I sign up as another user$/) do
  create_other_user
  sign_in_other_user
end

When(/^I click the edit link on that article$/) do
  click_link "Edit", :href=>"/articles/#{@article.id}/edit"
end

### THEN ###

Then(/^I see a new article link$/) do
  page.should have_link "New article"
end

Then(/^I should see the new article form$/) do
  page.should have_button "Create Article"
end

Then(/^I should see a page with "(.*?)" and "(.*?)" on it$/) do |title, body|
  page.should have_content title
  page.should have_content body
end

Then(/^I do not see a new article link$/) do
  page.should have_no_link "New article"
end

Then(/^I see a destroy link for that article$/) do
  page.should have_link "Destroy", :href=>"/articles/#{@article.id}"
end

Then(/^I do not see that article on the index page anymore$/) do
  page.should have_no_content @article.title
end

Then(/^I do not see the Delete link on that article$/) do
  page.should have_no_link "Destroy", :href=>"/articles/#{@article.id}"
end

Then(/^I do not see any Delete links for articles$/) do
  page.should have_no_link "Destroy"
end

Then(/^I can see all articles of the blog$/) do
  page.all(:xpath, '//div[@id="article"]').count == TEST_ARTICLES_COUNT
end

Then(/^I see an edit link for that article$/) do
  page.should have_link "Edit", :href=>"/articles/#{@article.id}/edit"
end

Then(/^I see the edit form for that article$/) do
  page.should have_button "Update Article"
end

When(/^I submit the form$/) do
  click_button "Update Article"
end

Then(/^I do not see the edit link on that article$/) do
  page.should have_no_link "Edit", :href=>"/articles/#{@article.id}/edit"
end

Then(/^I do not see any edit links for articles$/) do
  page.should have_no_link "Edit"
end

Then(/^I can see a date of creation on each article$/) do
  published_at_count = page.all(:xpath, '//p[contains(text(),"Published at")]').count  
  assert_equal published_at_count, TEST_ARTICLES_COUNT
end

Then(/^I see that the article listed first is the latest one$/) do
  all_articles = page.all(:xpath, '//p[contains(text(),"Published at")]')
  latest_article_time = all_articles[0].text.to_time
  next_article_time = all_articles[1].text.to_time
  expect(latest_article_time).to be >= next_article_time  
end