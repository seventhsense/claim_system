class Charge < ActiveRecord::Base
  has_one :document
  belongs_to :client
  has_many :orders
  accepts_nested_attributes_for :client
  accepts_nested_attributes_for :orders

  def total
    total = 0
    self.orders.each do |order|
      total = total + order.price
    end
    total 

  end

  def tax
    tax = self.total * 0.05
    #小数点以下切り捨て
    tax.to_i
  end

  def grand_total
    self.total + self.tax
  end


end
