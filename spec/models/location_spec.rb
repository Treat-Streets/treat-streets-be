require 'rails_helper'

RSpec.describe Location do

  it { should validate_presence_of :street_address }
  it { should validate_presence_of :city }
  it { should validate_presence_of :state }
  it { should validate_presence_of :zipcode }
  it { should validate_presence_of :location_type }
  it { should validate_presence_of :scariness_level }
  it { should validate_presence_of :start_time }
  it { should validate_presence_of :end_time }
  it { should validate_presence_of :latitude }
  it { should validate_presence_of :longitude }

  it { should belong_to :user }

end
