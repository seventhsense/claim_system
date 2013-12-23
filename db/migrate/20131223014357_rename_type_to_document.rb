class RenameTypeToDocument < ActiveRecord::Migration
  def change
    rename_column :documents, :type, :filetype
  end
end
