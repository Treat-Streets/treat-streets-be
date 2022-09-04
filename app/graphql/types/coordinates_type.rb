module Types
  class CoordinatesType < Types::BaseObject
    field :latitude, Float
    field :longitude, Float
    field :errors, [String], null: true
  end
end