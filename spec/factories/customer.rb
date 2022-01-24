FactoryBot.define do
  factory :customer do
    name { Faker::Lorem.characters(number: 20) }
    introduction { Faker::Lorem.characters(number: 100) }
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
