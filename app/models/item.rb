class Item < ApplicationRecord
  validates :name, :price, presence: true
  has_many :order_items

end
