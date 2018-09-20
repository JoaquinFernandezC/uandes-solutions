class CreateCaseTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :case_tasks do |t|
      t.references :task, foreign_key: true
      t.references :case, foreign_key: true

      t.timestamps
    end
  end
end
