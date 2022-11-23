class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  belongs_to :user, optional: true

  before_update :calculate_total
  enum status: { processing: 0, confirmed: 1, ready: 2, cancelled: 3 }

  private
  def calculate_total
    self.total = self.order_items.collect{|order_item| (order_item.item.price * order_item.quantity) + (order_item.item.tax * order_item.quantity)}.sum
  end
end
