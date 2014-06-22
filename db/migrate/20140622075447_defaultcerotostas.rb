class Defaultcerotostas < ActiveRecord::Migration
  def change
  		change_column_default :food_places, :stars, 0
  end
end
