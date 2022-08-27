require 'rails_helper'

module Mutations
  RSpec.describe "Posts" do

    describe "POST /graphql" do
      describe "happy path" do
        it "returns the location posted" do
          expect do
            post '/graphql', params: { query: query() }
          end.to change { Location.count }.by(1)                       
        end
      end
    end

    def query()
      <<~GQL
      mutation {
      createLocation (input: {
        streetAddress: "43 Sommerset Circle",
        city: "Greenwood Village",
        state: "CO",
        zipcode: "80111",
        locationType: "House",
        scarinessLevel: 0,
        description: "",
        startTime: "6:00",
        endTime: "8:00",
        image: "url",
        email: "t@gmail.com"
      }) {
    		location {
          streetAddress
          city
          state
          zipcode
          locationType
          scarinessLevel
          description
          startTime
          endTime
          image
          }
        }
      }
      GQL
    end
  end
end