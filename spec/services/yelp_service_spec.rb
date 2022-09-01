require 'rails_helper'

RSpec.describe "Yelp service" do

  it "gets restaurants", :vcr do
    json = YelpService.get_restaurants("denver,co", "chinese")

    expect(json).to have_key(:businesses)
    expect(json[:businesses].count).to eq(20)
    expect(json[:businesses].first[:location][:state]).to eq("CO")
  end
end
