require 'rails_helper'

module Mutations
  RSpec.describe "Posts", :vcr do

    describe "POST /graphql" do
      describe "happy path" do
        it "returns the location posted" do
          expect do
            post '/graphql', params: { query: query() }
          end.to change { Location.count }.by(1)                       
        end

        it 'returns all locations' do 
          post '/graphql', params: { query: query }
          post '/graphql', params: { query: query }

          post '/graphql', params: { query: get_query }
          
          json_response = JSON.parse(response.body, symbolize_names: true)
          expect(json_response[:data][:locations].count).to eq(2)
        end
      end

      describe "sad path" do
        it "returns error if address is invalid" do
          post '/graphql', params: { query: bad_query() }
          json_response = JSON.parse(response.body, symbolize_names: true)
          expect(json_response[:errors][0][:message]).to eq('Cannot return null for non-nullable field CreateLocationPayload.location')
        end
      end
    end

    def get_query
      <<~GQL
      query {
        locations {
          streetAddress
          city
          latitude
          longitude
        }
      }
      GQL
    end

    def bad_query
      <<~GQL
      mutation {
      createLocation (input: {
        streetAddress: "43 Sommerset Circle",
        city: "Kenosha",
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
          latitude
          longitude
          }
        }
      }
      GQL
    end

    def query
      <<~GQL
      mutation {
      createLocation (input: {
        streetAddress: "43 Sommerset Circle",
        city: "Englewood",
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