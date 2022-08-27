module Types
  class MutationType < Types::BaseObject
    field :create_location, mutation: Mutations::CreateLocation
  end
end
