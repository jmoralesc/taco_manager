class MenuLineItem < ActiveRecord::Base
  belongs_to :order
  #validates :name, :price, presence: true

end