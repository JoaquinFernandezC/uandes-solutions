class DropProjectTaskDocument < ActiveRecord::Migration[5.2]
  def change
    drop_table :project_task_documents
  end
end
