class DropCaseTaskDocument < ActiveRecord::Migration[5.2]
  def change
    drop_table :case_task_documents
  end
end
