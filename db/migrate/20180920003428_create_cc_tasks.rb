class CreateCcTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :cc_tasks do |t|
      t.references :case_coordination, foreign_key: true
      t.references :task, foreign_key: true

      t.timestamps
    end
  end
end
