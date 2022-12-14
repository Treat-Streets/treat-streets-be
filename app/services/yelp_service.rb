class YelpService
  def self.get_restaurants(location, food)
    response = conn.get("businesses/search?location=#{location}&categories=#{food}")
    get_json(response)
  end

  def self.get_json(response)
   JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new('https://api.yelp.com/v3/') do |faraday|
      faraday.headers['Authorization'] = ENV['YELP_API_KEY']
    end
  end
end
