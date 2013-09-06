FactoryGirl.define do
  sequence(:random_string) {|n| "That's the shizzle ipsizzle mammasay mammasa mamma oo sa pimpin#{n}" }

  factory :article do 
    title { generate(:random_string)}
    body  { generate(:random_string)}
    user {FactoryGirl.create(:user)}
  end

end