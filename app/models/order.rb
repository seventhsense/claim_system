class Order < ActiveRecord::Base
  belongs_to :charge
  belongs_to :product
  accepts_nested_attributes_for :product

  def price
    self.product.price * self.number
  end
end
