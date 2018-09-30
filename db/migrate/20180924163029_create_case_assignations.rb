class CreateCaseAssignations < ActiveRecord::Migration[5.2]
  def change
    create_table :case_assignations do |t|
      t.references :user, foreign_key: true
      t.references :cause, foreign_key: true

      t.timestamps
    end
  end
end
