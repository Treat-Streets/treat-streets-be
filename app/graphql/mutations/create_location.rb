class Mutations::CreateLocation < Mutations::BaseMutation
  argument :street_address, String, required: true
  argument :city, String, required: true
  argument :state, String, required: true
  argument :zipcode, String, required: true
  argument :location_type, String, required: true
  argument :description, String, required: false
  argument :scariness_level, Integer, required: true
  argument :start_time, String, required: true
  argument :end_time, String, required: true
  argument :image, String, required: false
  argument :email, String, required: true

  field :location, Types::LocationType, null: true
  field :errors, [String], null: false

  def resolve(street_address:, city:, state:, zipcode:, location_type:, description:, scariness_level:, start_time:, end_time:, image:, email:)
    user = User.find_or_create_by(email: email)
    lat_long = GeocoderFacade.get_coordinates(street_address, city, state)
      
    location = Location.new(street_address: street_address, city: city, state: state, zipcode: zipcode, location_type: location_type, description: description, 
                            scariness_level: scariness_level, start_time: start_time, end_time: end_time, image: image, user: user, latitude: lat_long[:lat], longitude: lat_long[:lng])
    if location.save
      {
        location: location,
        errors: []
      }
    else
      if lat_long == {}
        {
          location: nil,
          errors: ["Invalid Address."]
        }
      else
        {
          location: nil,
          errors: user.errors.full_messages
        }
      end
    end
  end
end
