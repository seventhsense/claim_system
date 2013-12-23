class Product < ActiveRecord::Base
  def name_and_price
    self.name + ' ' + self.price.to_s + '円'
  end

  def price_to_currency
    number_to_currency self.price
  end

  def number_to_currency(number)
    ActiveSupport::NumberHelper.number_to_currency(number, {unit: '¥', precision: 0})
  end
end
