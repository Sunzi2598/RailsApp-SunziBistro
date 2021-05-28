class Product < ApplicationRecord
  has_one_attached :image
  has_many :order_items, dependent: :destroy 
  has_many :order_details, dependent: :destroy 
  has_many :orders
  
  validates :title, presence: true
  validates :price, presence: true, numericality: { :greater_than => 0 }
  validates :description, presence: true
end
