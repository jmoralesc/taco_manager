class Add < ActiveRecord::Migration
  def change
  	add_column :food_places, :rating, :decimal, :default => 0
  end
end
