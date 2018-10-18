class DropDerivationTaskDocument < ActiveRecord::Migration[5.2]
  def change
    drop_table :derivation_task_documents
  end
end
