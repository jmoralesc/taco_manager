class ChangeColumnTypeToPriceMenuOptions < ActiveRecord::Migration
  def change
  	change_column :menu_options, :price, :decimal
  end
end
