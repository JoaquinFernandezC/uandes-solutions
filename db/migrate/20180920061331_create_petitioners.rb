class CreatePetitioners < ActiveRecord::Migration[5.2]
  def change
    create_table :petitioners do |t|
      t.references :people, foreign_key: true
      t.string :position
      t.string :location

      t.timestamps
    end
  end
end
