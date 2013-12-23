class Client < ActiveRecord::Base
  belongs_to :order
  belongs_to :charge
end
