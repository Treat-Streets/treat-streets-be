class GeocoderFacade
  def self.get_coordinates(address, city, state)
    location = "#{address} #{city} #{state}"
    if GeocoderFacade.validate_alpha_numeric(address)
      json_response = GeocoderService.get_coordinates(location)
      if GeocoderFacade.validate_location?(city, state, json_response)
        lat_long = {
          lat: json_response[:results][0][:locations][0][:latLng][:lat],
          lng: json_response[:results][0][:locations][0][:latLng][:lng]
        }
      else
        {}
      end
    else
      {}
    end
  end

  def self.get_coordinates_by_zip(zipcode)
    if valid_zip?(zipcode)
      json_response = GeocoderService.get_coordinates(zipcode)
      lat_long = {
          lat: json_response[:results][0][:locations][0][:latLng][:lat],
          lng: json_response[:results][0][:locations][0][:latLng][:lng]
        }
    else
      {}
    end
  end

  private 

  def self.validate_location?(city, state, json_response)
    street = json_response[:results][0][:locations][0][:street]
    response_city = json_response[:results][0][:locations][0][:adminArea5]
    response_state = json_response[:results][0][:locations][0][:adminArea3]

    GeocoderFacade.valid_street?(street) && GeocoderFacade.valid?(response_city, city) && GeocoderFacade.valid?(response_state, state)
  end

  def self.valid?(expected, actual)
    expected == actual
  end

  def self.validate_alpha_numeric(string)
    string.chr.match(/[0-9A-Za-z ]/)
  end

  def self.valid_street?(street)
    !street.include?('[') && street != ''
  end

  def self.valid_zip?(zipcode)
    zipcode.length == 5 && zipcode.match(/[^0-9]/) == nil
  end

end