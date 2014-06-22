class FoodPlaceStars < ActiveRecord::Migration
  def change
  	remove_column :food_places, :level
  	add_column :food_places, :stars, :decimal
  	add_column :food_places, :times_rated, :integer
  end
end
