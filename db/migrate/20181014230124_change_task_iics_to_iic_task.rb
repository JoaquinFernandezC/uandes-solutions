class ChangeTaskIicsToIicTask < ActiveRecord::Migration[5.2]
  def change
    rename_table :task_iics, :iic_tasks
  end
end
