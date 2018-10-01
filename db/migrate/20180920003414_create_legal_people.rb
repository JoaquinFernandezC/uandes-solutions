class CreateLegalPeople < ActiveRecord::Migration[5.2]
  def change
    create_table :legal_people do |t|
      t.string :name
      t.string :rut

      t.timestamps
    end
  end
end
