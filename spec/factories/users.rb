FactoryGirl.define do
  factory :user do
    name 'Test User'
    email 'example@example.com'
    password 'secret'
    password_confirmation 'secret'
  end
end