class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.integer :year
      t.integer :project_number
      t.string :name
      t.string :objective
      t.string :state
      t.datetime :start_date
      t.date :estimated_end_date
      t.date :end_date
      t.integer :privacy
      t.string :log

      t.timestamps
    end
  end
end
