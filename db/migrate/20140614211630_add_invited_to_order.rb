


class AddInvitedToOrder < ActiveRecord::Migration
  def change
   add_column :orders, :invited_users, :string
  end
end