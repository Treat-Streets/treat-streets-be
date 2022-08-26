class Location < ApplicationRecord

  validates_presence_of :street_address, :city, :state, :zipcode, :type, :scariness_level, :start_time, :end_time, :image
  belongs_to :user

end