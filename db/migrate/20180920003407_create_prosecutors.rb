class CreateProsecutors < ActiveRecord::Migration[5.2]
  def change
    create_table :prosecutors do |t|
      t.string :name
      t.string :rut
      t.string :local_office

      t.timestamps
    end
  end
end
