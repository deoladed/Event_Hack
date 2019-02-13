FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { '#$taawktljasktlw4aaglj' }
    description { Faker::ChuckNorris.fact }
    first_name { Faker::TvShows::RickAndMorty.character }
    last_name { Faker::TvShows::RickAndMorty.character }
  end
end
