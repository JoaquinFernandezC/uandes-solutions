class CreateDerivationAssignations < ActiveRecord::Migration[5.2]
  def change
    create_table :derivation_assignations do |t|
      t.references :derivation, foreign_key: true
      t.references :user, foreign_key: true
      t.date :assignation_date
      t.date :deassignment_date

      t.timestamps
    end
  end
end
