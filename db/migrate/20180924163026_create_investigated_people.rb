class CreateInvestigatedPeople < ActiveRecord::Migration[5.2]
  def change
    create_table :investigated_people do |t|
      t.references :person, foreign_key: true
      t.references :cause, foreign_key: true

      t.timestamps
    end
  end
end
