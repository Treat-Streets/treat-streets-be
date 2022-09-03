module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :locations, [Types::LocationType], null: false
    field :coordinates, [Types::CoordinateType], null: false

    def locations
      Location.all
    end

    def coordinates

    end
  end
end
