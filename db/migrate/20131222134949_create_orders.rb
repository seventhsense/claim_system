class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :product_id
      t.integer :number
      t.integer :client_id
      t.integer :charge_id

      t.timestamps
    end
  end
end
