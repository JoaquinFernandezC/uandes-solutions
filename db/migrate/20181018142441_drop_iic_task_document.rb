class DropIicTaskDocument < ActiveRecord::Migration[5.2]
  def change
    drop_table :iic_task_documents
  end
end
