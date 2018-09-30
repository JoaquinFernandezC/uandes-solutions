class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.references :user, foreign_key: true
      t.datetime :start_date
      t.datetime :estimated_end_date
      t.datetime :end_date
      t.integer :privacy
      t.integer :priority
      t.string :state
      t.boolean :needs_checking
      t.string :log

      t.timestamps
    end
  end
end
