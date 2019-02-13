# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Database cleaning'
Attandance.destroy_all
Event.destroy_all
User.destroy_all
puts 'Database cleaned !'

puts 'Start seeding...'
10.times do
	User.create!(email: Faker::Internet.email,	password: '#$taawktljasktlw4aaglj', description: Faker::ChuckNorris.fact, first_name: Faker::Movies::Hobbit.character, last_name: Faker::TvShows::RickAndMorty.character)
end
puts '10 users created'


5.times do
	Event.create!(start_date: Faker::Date.forward(23), 
							 duration: rand(1..100)*5, 
							 title: Faker::Hacker.say_something_smart, 
							 description: Faker::Lorem.paragraph_by_chars(100), 
							 price: rand(1..1000), location: Faker::TvShows::RickAndMorty.location, 
							 admin: User.all.sample)
end
puts '5 events created'


5.times do
	Attandance.create!(stripe_customer_id: 'blank',
										user: User.all.sample,
										event: Event.all.sample
									)	
end
puts '5 attandances created'
puts 'Database seeded, enjoy you new database'