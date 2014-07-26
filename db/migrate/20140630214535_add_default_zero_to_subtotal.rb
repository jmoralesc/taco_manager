class AddDefaultZeroToSubtotal < ActiveRecord::Migration
  def change
  	change_column_default :menu_line_items, :subtotal, 0
  end
end
