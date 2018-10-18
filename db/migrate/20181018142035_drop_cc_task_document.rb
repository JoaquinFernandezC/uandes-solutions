class DropCcTaskDocument < ActiveRecord::Migration[5.2]
  def change
    drop_table :cc_task_documents
  end
end
