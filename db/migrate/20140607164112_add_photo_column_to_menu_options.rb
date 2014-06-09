class AddPhotoColumnToMenuOptions < ActiveRecord::Migration
  def change
  	add_column :menu_options, :photo, :string
  end
end
