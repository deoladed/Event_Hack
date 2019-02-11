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

20.times do |i|
	User.create(email: Faker::Internet.email,	encrypted_password: 'blank', description: Faker::ChuckNorris.fact, first_name: Faker::Hobbit.character, last_name: Faker::RickAndMorty.character)
	print i + 1
	puts 'users created'
end


5.times do |i|
	Event.create(start_date: Faker::Date.forward(23), 
								duration: 55,
								title: Faker::RickAndMorty.quote,
								description: Faker::Lorem.paragraph_by_chars(100),
								price: rand(1..1000),
								location: Faker::RickAndMorty.location,
								admin: User.all.sample
								)
	print i + 1
puts 'events created'
end


40.times do |i|
	Attandance.create(stripe_customer_id: 'blank',
										user: User.all.sample,
										event: Event.all.sample
									)	
	print i + 1
puts 'attandances created'
end
puts 'Database seeded, enjoy you new database'