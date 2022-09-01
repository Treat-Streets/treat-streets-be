# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!(email: "email@gmail.com")

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
