class Product < ApplicationRecord
  has_many :images
  has_many :orders
  has_many :category_products
  has_many :categories, through: :category_products
  has_many :carted_products

  validates :name, :price , presence: true
  validates :price, numericality: true
  
  def tax
    return price * 0.09
  end
end
