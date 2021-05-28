class OrderItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product
  validates :quantity, presence: true, numericality: { greater_than: 0 }

  def total_price
    self.quantity * self.product.price
  end
end