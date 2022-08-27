class Mutation::CreateLocation < Mutations::BaseMutation
  argument :street_address, String, required: true
  argument :city, String, required: true
  argument :state, String, required: true
  argument :zipcode, String, required: true
  argument :location_type, String, required: true
  argument :description, String, required: true
  argument :scariness_level, Integer, required: true
  argument :start_time, String, required: true
  argument :end_time, String, required: true
  argument :image, String, required: false

  field :location, Types::LocationType, null: false
  field :errors, [String], null: false

  def resolve(street_address:, city:, state:, zipcode:, location_type:, description:, scariness_level:, start_time:, end_time:, image:)
    location = Location.new(street_address: street_address, city: city, state: state, zipcode: zipcode, location_type: location_type, description: description, scariness_level: scariness_level, start_time: start_time, end_time: end_time, image: image)
  
    if (location.save)
      {
        location: location,
        errors: []
      }
    else
      location: nil,
      errors: user.errors.full_messages
    end
  end
end