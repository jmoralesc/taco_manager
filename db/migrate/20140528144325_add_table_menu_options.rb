class AddTableMenuOptions < ActiveRecord::Migration
  def change
  	create_table :menu_options do |t|
      t.string :name
      t.integer :price

      t.timestamps
    end  
  end
end
