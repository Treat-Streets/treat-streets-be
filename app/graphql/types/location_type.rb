# frozen_string_literal: true

module Types
  class LocationType < Types::BaseObject
    field :id, ID, null: false
    field :street_address, String
    field :city, String
    field :state, String
    field :zipcode, String
    field :location_type, String
    field :scariness_level, Integer
    field :description, String
    field :start_time, String
    field :end_time, String
    field :image, String
    field :latitude, Float
    field :longitude, Float
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :user_id, Integer
  end
end
