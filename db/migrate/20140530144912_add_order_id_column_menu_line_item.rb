class AddOrderIdColumnMenuLineItem < ActiveRecord::Migration
  def change
    add_column :menu_line_items, :order_id, :integer
  end
end
