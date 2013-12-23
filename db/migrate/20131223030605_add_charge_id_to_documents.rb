class AddChargeIdToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :charge_id, :integer
  end
end
