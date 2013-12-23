class Order < ActiveRecord::Base
  belongs_to :charge
  belongs_to :product
  accepts_nested_attributes_for :product

  def price
    self.product.price * self.number
  end

  def price_to_currency
    number_to_currency self.price
  end

  def number_to_currency(number)
    ActiveSupport::NumberHelper.number_to_currency(number, {unit: '¥', precision: 0})
  end
end
