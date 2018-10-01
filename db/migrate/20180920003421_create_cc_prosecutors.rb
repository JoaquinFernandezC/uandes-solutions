class CreateCcProsecutors < ActiveRecord::Migration[5.2]
  def change
    create_table :cc_prosecutors do |t|
      t.references :case_coordination, foreign_key: true
      t.references :prosecutor, foreign_key: true

      t.timestamps
    end
  end
end
