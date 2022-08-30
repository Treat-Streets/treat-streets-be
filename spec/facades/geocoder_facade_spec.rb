require 'rails_helper'

RSpec.describe GeocoderFacade, :vcr do
  context 'success' do
    it 'returns lat and long' do
      address = '8301 64th St'
      city = 'Kenosha'
      state = 'WI'
      
      lat_long = GeocoderFacade.get_coordinates(address, city, state)
      
      expect(lat_long[:lat]).to be_a(Float)
      expect(lat_long[:lng]).to be_a(Float)
    end
  end

  context 'failure' do
    it 'returns something' do
      address = ''
      city = ''
      state = ''
      lat_long = GeocoderFacade.get_coordinates(address, city, state)
      
      expect(lat_long[:lat]).to eq(nil)
      expect(lat_long[:lng]).to eq(nil)
    end
  end

end