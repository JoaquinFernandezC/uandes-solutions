class CreateAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :authors do |t|
      t.references :person, foreign_key: true
      t.references :document, foreign_key: true
      t.string :position

      t.timestamps
    end
  end
end
