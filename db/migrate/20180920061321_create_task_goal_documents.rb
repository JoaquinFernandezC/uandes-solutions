class CreateTaskGoalDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :task_goal_documents do |t|
      t.references :task_goal, foreign_key: true
      t.references :document, foreign_key: true

      t.timestamps
    end
  end
end
