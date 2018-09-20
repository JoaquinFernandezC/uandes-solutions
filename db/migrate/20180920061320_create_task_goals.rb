class CreateTaskGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :task_goals do |t|
      t.references :goal, foreign_key: true
      t.references :task, foreign_key: true

      t.timestamps
    end
  end
end
