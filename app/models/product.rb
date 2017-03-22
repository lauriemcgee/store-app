class Product < ApplicationRecord
  has_many :images
  def tax
    return price * 0.09
  end
end
