class ChangeDocumentTaskIicToIicTaskDocument < ActiveRecord::Migration[5.2]
  def change
    rename_table :document_task_iics, :iic_task_documents
  end
end
