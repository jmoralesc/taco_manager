class AddImageToFoodPlace < ActiveRecord::Migration
  def change
    add_column :food_places, :photo, :string
  end
end
