class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.string :subject
      t.integer :document_id
      t.integer :client_id

      t.timestamps
    end
  end
end
