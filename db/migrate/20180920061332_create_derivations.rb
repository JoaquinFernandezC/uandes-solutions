class CreateDerivations < ActiveRecord::Migration[5.2]
  def change
    create_table :derivations do |t|
      t.string :name
      t.text :description
      t.references :petitioner, foreign_key: true
      t.string :state
      t.integer :priority
      t.date :derivation_date
      t.datetime :work_start_date
      t.string :estimated_work_start_date
      t.date :estimated_end_date
      t.date :end_date
      t.string :log
      t.integer :privacy

      t.timestamps
    end
  end
end
