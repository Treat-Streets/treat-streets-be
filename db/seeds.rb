# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!(email: "email@gmail.com")
user2 = User.create!(email: "fake@gmail.com")
user3 = User.create!(email: "demo@gmail.com")

cities = ["Denver", "Lakewood", "Aurora", "Arvada", "Englewood", "Westminster", "Thornton", "Broomfield", "Applewood", "Littleton", "Centennial", "Boulder", "Brighton"]
cities.each do |city|
  response = YelpService.get_restaurants("#{city},CO", "food")
  locations = response[:businesses]
  locations.each do |location|
    Location.create!(street_address: location[:location][:address1],
                    city: location[:location][:city],
                    state: location[:location][:state],
                    zipcode: location[:location][:zip_code],
                    location_type: "Business",
                    start_time: "3:00",
                    end_time: "7:00",
                    latitude: location[:coordinates][:latitude],
                    longitude: location[:coordinates][:longitude],
                    scariness_level: 2,
                    image: "url.com",
                    user: user)
  end
end

Location.create!(street_address: "43 Sommerset Circle", city: "Englewood", state:"CO",
   zipcode: "80111", location_type: "Home", start_time: "3:00", end_time: "7:00", latitude: 39.614408 , longitude: -104.892167, scariness_level: 2, image: "url.com", user: user)
Location.create!(street_address: "3815 S Bannock St", city: "Englewood", state:"CO",
   zipcode: "80110", location_type: "Home", start_time: "3:00", end_time: "7:00", latitude: 39.647048, longitude: -104.990167, scariness_level: 6, image: "scaryhouses.com", user: user1)
Location.create!(street_address: "3822 S Bannock St", city: "Englewood", state:"CO",
   zipcode: "80110", location_type: "Home", start_time: "3:00", end_time: "7:00", latitude: 39.64680, longitude: -104.98997, scariness_level: 3, image: "scaryhouses.com", user: user2)
Location.create!(street_address: "3865 S Bannock St", city: "Englewood", state:"CO",
   zipcode: "80110", location_type: "Home", start_time: "5:00", end_time: "8:00", latitude: 39.64649, longitude: -104.99025, scariness_level: 3, image: "scaryhouses.com", user: user2)
Location.create!(street_address: "3890 S Bannock St", city: "Englewood", state:"CO",
   zipcode: "80110", location_type: "Home", start_time: "5:00", end_time: "8:00", latitude: 39.64610, longitude: -104.98997, scariness_level: 3, image: "scaryhouses.com", user: user2)

