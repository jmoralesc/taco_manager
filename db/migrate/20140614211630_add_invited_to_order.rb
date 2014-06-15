class AddInvitedToOrder < ActiveRecord::Migration
  def change
  	 add_column :orders, :invited_users, :hash
  end
end
