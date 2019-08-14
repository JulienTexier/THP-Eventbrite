User.destroy_all
Event.destroy_all
Attendance.destroy_all

#Création de pierre michel
email = "pierre.michel@yopmail.com"
description = "Salut, moi c'est Pierre Michel, je suis un User de test"
first_name = "Pierre"
last_name = "Michel"
password = "azerty" #password très safe, je recommande vivement
User.create(email:email, description:description, first_name:first_name, last_name:last_name, password: password, password_confirmation: password)

#Création de users
10.times do
	email = Faker::Internet.email
	description = Faker::TvShows::Community.quotes
	first_name = Faker::Name.first_name
	last_name = Faker::Name.last_name
	password = "azerty" #password très safe, je recommande vivement
	User.create(email:email, description:description, first_name:first_name, last_name:last_name, password: password, password_confirmation: password)
end

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