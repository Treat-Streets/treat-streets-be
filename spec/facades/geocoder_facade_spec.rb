require 'rails_helper'

RSpec.describe GeocoderFacade do
  context 'happy path' do
    it 'returns lat and long', :vcr do
      address = '8301 64th St'
      city = 'Kenosha'
      state = 'WI'
      
      lat_long = GeocoderFacade.get_coordinates(address, city, state)
      
      expect(lat_long[:lat]).to be_a(Float)
      expect(lat_long[:lng]).to be_a(Float)
    end
  end
end