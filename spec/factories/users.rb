FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    encrypted_password { "blank" }
    description { Faker::ChuckNorris.fact }
    first_name { Faker::RickAndMorty.character }
    last_name { Faker::RickAndMorty.character }
  end
end
