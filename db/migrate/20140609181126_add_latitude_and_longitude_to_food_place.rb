class AddLatitudeAndLongitudeToFoodPlace < ActiveRecord::Migration
  def change
    add_column :food_places, :latitude, :float
    add_column :food_places, :longitude, :float
  end
end
