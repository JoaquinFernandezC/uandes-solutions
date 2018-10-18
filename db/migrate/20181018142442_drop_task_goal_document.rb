class DropTaskGoalDocument < ActiveRecord::Migration[5.2]
  def change
    drop_table :task_goal_documents
  end
end
