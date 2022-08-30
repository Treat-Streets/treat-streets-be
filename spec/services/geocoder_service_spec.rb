require 'rails_helper'

RSpec.describe GeocoderService do
  describe "#get_coordinates", :vcr do
    context 'success' do
      let(:location) { "8301 64th St Kenosha, WI" }
      let(:response) { GeocoderService.get_coordinates(location) }

      it 'returns lat and long' do
        expect(response).to be_a(Hash)
        data = response[:results][0]
        expect(data).to be_a(Hash)
        lat_long = data[:locations][0][:latLng]
        expect(lat_long).to have_key(:lat)
        expect(lat_long).to have_key(:lng)
        expect(lat_long[:lat]).to be_a(Float)
        expect(lat_long[:lng]).to be_a(Float)
      end
    end

    context 'failure' do
      let(:location) { "" }
      let(:response) { GeocoderService.get_coordinates(location) }
      
      it 'returns error message if location is empty string' do
        expect(response).to be_a(Hash)
        status_code = response[:info][:statuscode]
        expect(status_code).to eq(400)
        expect(response[:info][:messages][0]).to eq('Illegal argument from request: Insufficient info for location')
      end
    end
  end
end