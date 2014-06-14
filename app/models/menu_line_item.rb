class MenuLineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :menu_option
  belongs_to :user
  #validates :name, :price, presence: true

end