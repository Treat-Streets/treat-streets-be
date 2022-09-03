require 'rails_helper'

module Mutations
  RSpec.describe "Posts", :vcr do

    describe "POST /graphql" do
      context "success" do
        describe "createLocation mutation" do
          it "returns the location posted" do
            expect do
              post '/graphql', params: { query: query() }
            end.to change { Location.count }.by(1)                       
          end
        end

        describe "locations query" do
          it 'returns all locations' do 
            post '/graphql', params: { query: query }
            post '/graphql', params: { query: query }

            post '/graphql', params: { query: get_query }
            
            json_response = JSON.parse(response.body, symbolize_names: true)
            expect(json_response[:data][:locations].count).to eq(2)
          end
        end
      end

      context "failure" do
        describe "createLocation mutation" do
          it "returns 'Invalid address' error if address is invalid" do
            post '/graphql', params: { query: invalid_address_query() }
            json_response = JSON.parse(response.body, symbolize_names: true)
            expect(json_response[:data][:createLocation][:errors][0]).to eq('Invalid address')
          end
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

    def invalid_address_query
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
        errors
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