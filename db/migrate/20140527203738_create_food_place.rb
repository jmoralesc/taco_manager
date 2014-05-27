class CreateFoodPlace < ActiveRecord::Migration
  def change
    create_table :food_places do |t|
      t.string :name
      t.string :phone_number
      t.string :time
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
