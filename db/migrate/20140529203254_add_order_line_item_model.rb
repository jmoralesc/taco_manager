class AddOrderLineItemModel < ActiveRecord::Migration
  def change
  	create_table :menu_line_items do |t|
      t.integer :menu_option_id
      t.integer :user_id
      t.integer :quantiy
      t.decimal :subtotal

      t.timestamps
    end  
  end
end
