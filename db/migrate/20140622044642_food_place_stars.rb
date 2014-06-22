class FoodPlaceStars < ActiveRecord::Migration
  def change

  	add_column :food_places, :stars, :decimal
  	add_column :food_places, :times_rated, :integer
  end
end
