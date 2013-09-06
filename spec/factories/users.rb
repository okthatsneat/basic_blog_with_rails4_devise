FactoryGirl.define do
  factory :user do
    sequence(:name) {|n| "Name#{n}" }
    sequence(:email) {|n| "email#{n}@factory.com" }
    password 'secret_password'
    password_confirmation 'secret_password'
  end
end