FactoryBot.define do
  factory :post do
    title { Faker::Lorem.characters(number:100) }
    body { Faker::Lorem.characters(number:1000) }
  end
end
