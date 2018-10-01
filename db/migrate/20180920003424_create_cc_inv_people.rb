class CreateCcInvPeople < ActiveRecord::Migration[5.2]
  def change
    create_table :cc_inv_people do |t|
      t.references :person, foreign_key: true
      t.references :case_coordination, foreign_key: true

      t.timestamps
    end
  end
end
