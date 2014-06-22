class Defaultcerotimesrated < ActiveRecord::Migration
  def change
  	change_column_default :food_places, :times_rated, 0
  
  end
end
