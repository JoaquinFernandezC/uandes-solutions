class CreateInvLegalPeople < ActiveRecord::Migration[5.2]
  def change
    create_table :inv_legal_people do |t|
      t.references :legal_person, foreign_key: true
      t.references :case, foreign_key: true

      t.timestamps
    end
  end
end
