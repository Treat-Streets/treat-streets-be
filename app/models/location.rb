class Location < ApplicationRecord

  validates_presence_of :street_address, :city, :state, :zipcode, :location_type, :scariness_level, :start_time, :end_time, :image, :latitude, :longitude
  belongs_to :user

end
