class CreateRucFelonies < ActiveRecord::Migration[5.2]
  def change
    create_table :ruc_felonies do |t|
      t.references :felony, foreign_key: true
      t.references :ruc, foreign_key: true

      t.timestamps
    end
  end
end
