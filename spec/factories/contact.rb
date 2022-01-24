FactoryBot.define do
  factory :contact do
    name { Faker::Lorem.characters(number: 20) }
    email { Faker::Internet.email }
    title { Faker::Lorem.characters(number: 200) }
    body { Faker::Lorem.characters(number: 500) }
  end
end