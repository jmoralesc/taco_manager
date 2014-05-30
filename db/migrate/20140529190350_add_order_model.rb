class AddOrderModel < ActiveRecord::Migration
  
  def change
  	create_table :orders do |t|
      t.integer :food_place_id
      t.integer :user_id
      t.decimal :total

      t.timestamps
    end  
  end
end
