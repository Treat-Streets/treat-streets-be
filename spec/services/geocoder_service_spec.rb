require 'rails_helper'

RSpec.describe GeocoderService do
  context 'happy path' do
    it 'returns lat and long', :vcr do
      location = '8301 64th St Kenosha, WI'
      response = GeocoderService.get_coordinates(location)
      
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
end