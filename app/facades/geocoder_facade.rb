class GeocoderFacade
  def self.get_coordinates(address, city, state)
    location = "#{address} #{city} #{state}"
    json_response = GeocoderService.get_coordinates(location)
    if GeocoderFacade.validate_location?(address, city, state, json_response)
      lat_long = {
        lat: json_response[:results][0][:locations][0][:latLng][:lat],
        lng: json_response[:results][0][:locations][0][:latLng][:lng]
      }
    else
      {}
    end
  end

  def self.validate_location?(address, city, state, json_response)
    street = json_response[:results][0][:locations][0][:street]
    response_city = json_response[:results][0][:locations][0][:adminArea5]
    response_state = json_response[:results][0][:locations][0][:adminArea3]
    if street.include?('[') || street == ''
      return false
    elsif response_city != city
      return false
    elsif response_state != state
      return false
    else
      return true
    end

  end
end