FactoryBot.define do
  factory :event do
    start_date { Faker::Date.forward(23) }
    duration { 55 }
    title { 'Factory Title' }
    description { Faker::Lorem.paragraph_by_chars(100) }
    price { rand(1..1000) }
    location { Faker::RickAndMorty.location }
    admin { FactoryBot.create(:user) }
  end
end
