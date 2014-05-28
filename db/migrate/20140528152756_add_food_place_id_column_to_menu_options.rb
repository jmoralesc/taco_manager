class AddFoodPlaceIdColumnToMenuOptions < ActiveRecord::Migration
  def change
  	add_column :menu_options, :food_place_id, :integer
  end
end
