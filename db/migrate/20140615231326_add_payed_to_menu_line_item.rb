class AddPayedToMenuLineItem < ActiveRecord::Migration
  def change
  	create_column :menu_line_items, :payed, :integer, :default => 0
  end
end
