class GeocoderFacade
  def self.get_coordinates(address, city, state)
    location = "#{address} #{city},#{state}"
    json_response = GeocoderService.get_coordinates(location)
    lat_long = {
      lat: json_response[:results][0][:locations][0][:latLng][:lat],
      lng: json_response[:results][0][:locations][0][:latLng][:lng]
    }
  end
end