class GeocoderService
  def self.connection
    Faraday.new(url: "http://www.mapquestapi.com")
  end

  def self.get_coordinates(location)
    response = connection.get("/geocoding/v1/address?key=#{ENV['MAPQUEST_KEY']}&location=#{location}")
    json = JSON.parse(response.body, symbolize_names: true)
  end

end