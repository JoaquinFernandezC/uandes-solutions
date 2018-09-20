class CreateCcAssignations < ActiveRecord::Migration[5.2]
  def change
    create_table :cc_assignations do |t|
      t.references :user, foreign_key: true
      t.references :case_coordination, foreign_key: true

      t.timestamps
    end
  end
end
