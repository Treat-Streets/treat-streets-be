class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :type
      t.integer :scariness_level
      t.string :description
      t.string :start_time
      t.string :end_time
      t.string :image
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
