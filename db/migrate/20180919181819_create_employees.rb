class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.references :person, foreign_key: true
      t.references :institution, foreign_key: true
      t.string :position

      t.timestamps
    end
  end
end
