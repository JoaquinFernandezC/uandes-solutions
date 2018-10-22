class RenameDocumentTypetoDocType < ActiveRecord::Migration[5.2]
  def change
    rename_column :documents, :type, :docType
  end
end
