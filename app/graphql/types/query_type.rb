module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :locations, [Types::LocationType], null: true
    field :coordinates, Types::CoordinatesType, null: true do
      argument :zipcode, String
    end

    def locations
      Location.all
    end

    def coordinates(zipcode:)
      lat_long = GeocoderFacade.get_coordinates_by_zip(zipcode)
      if lat_long == {}
        {
          coordinates: nil,
          errors: ["Invalid Zip Code."]
        }
      else
        {
          latitude: lat_long[:lat],
          longitude: lat_long[:lng]
        }
      end
    end
  end
end
