class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.integer :year
      t.integer :goal_number
      t.string :name
      t.text :description
      t.string :state
      t.date :estimated_end_date
      t.date :end_date
      t.integer :privacy
      t.string :log

      t.timestamps
    end
  end
end
