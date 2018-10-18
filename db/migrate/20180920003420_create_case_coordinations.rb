class CreateCaseCoordinations < ActiveRecord::Migration[5.2]
  def change
    create_table :case_coordinations do |t|
      t.string :name
      t.string :description
      t.string :state
      t.datetime :estimated_end_date
      t.integer :privacy

      t.timestamps
    end
  end
end
