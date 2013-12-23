class Product < ActiveRecord::Base
  def name_and_price
    self.name + ' ' + self.price.to_s + '円'
  end
end
