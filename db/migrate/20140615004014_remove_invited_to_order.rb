class RemoveInvitedToOrder < ActiveRecord::Migration
  def change
  	 remove_column :orders, :invited_users
  end
end
