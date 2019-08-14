# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Event.destroy_all
Attendance.destroy_all

10.times do 
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
	description = Faker::TvShows::SouthPark.quote
	User.create(first_name: first_name, last_name: last_name, email: "#{first_name.downcase}.#{last_name.downcase}@yopmail.com", description: description, encrypted_password: Faker::TvShows::SouthPark.quote)
end

#Création de pierre michel
email = "julien.michel@yopmail.com"
description = "Salut, moi c'est Julien Michel, je suis un User de test"
first_name = "Julien"
last_name = "Michel"
password = "azerty" #password très safe, je recommande vivement
User.create(email:email, description:description, first_name:first_name, last_name:last_name, encrypted_password: password)

#Créations d'events
15.times do
	start_date = Faker::Time.forward(days: 60)
	duration = rand(9)*60 + rand(12)*5
	title = Faker::Music::RockBand.name
	while title.length <= 5
		title += " " + Faker::Music::RockBand.name
	end
	description = Faker::Movies::StarWars.quote
	while description.length <= 100
		description += " " + Faker::Movies::StarWars.quote
	end
	price = rand(1..1000)
	location = Faker::Address.full_address
	admin = User.all.sample
	Event.create(start_date:start_date, duration:duration, title:title, description:description, price:price, location:location, admin:admin)
end

# Création d'attendances
20.times do
  stripe_customer_id = ""
  participant = User.all.sample
  event = Event.all.sample
  Attendance.create(stripe_customer_id: stripe_customer_id, participant: participant, event: event)
end