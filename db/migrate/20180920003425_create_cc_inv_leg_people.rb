class CreateCcInvLegPeople < ActiveRecord::Migration[5.2]
  def change
    create_table :cc_inv_leg_people do |t|
      t.references :legal_person, foreign_key: true
      t.references :case_coordination, foreign_key: true

      t.timestamps
    end
  end
end
