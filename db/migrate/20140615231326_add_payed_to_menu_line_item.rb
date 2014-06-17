class AddPayedToMenuLineItem < ActiveRecord::Migration
  def change
  	change_column :menu_line_items, :payed, :integer, :default => 0
  end
end
