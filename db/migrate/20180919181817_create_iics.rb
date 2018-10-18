class CreateIics < ActiveRecord::Migration[5.2]
  def change
    create_table :iics do |t|
      t.string :name
      t.text :description
      t.string :state
      t.datetime :start_date
      t.datetime :estimated_end_date
      t.datetime :end_date
      t.integer :privacy
      t.boolean :multilateral

      t.timestamps
    end
  end
end
