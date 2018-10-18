class ChangeDocumentIicToIicDocument < ActiveRecord::Migration[5.2]
  def change
    rename_table :document_iics, :iic_documents
  end
end
