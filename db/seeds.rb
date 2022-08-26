# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!(email: "email@gmail.com")

location = Location.create!(street_address: "43 Sommerset Circle", city: "Greenwood Village", state:"CO", zipcode: "80111", location_type: "Home", start_time: "3:00", end_time: "7:00", latitude: 39.614408 , longitude: -104.892167, scariness_level: 2, image: "url.com", user: user)
