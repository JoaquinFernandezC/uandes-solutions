class CreateTaskIics < ActiveRecord::Migration[5.2]
  def change
    create_table :task_iics do |t|
      t.references :iic, foreign_key: true
      t.references :task, foreign_key: true

      t.timestamps
    end
  end
end
