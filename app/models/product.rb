class Product < ApplicationRecord
  has_many :images
  has_many :orders
  def tax
    return price * 0.09
  end
end
