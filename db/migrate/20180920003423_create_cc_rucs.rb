class CreateCcRucs < ActiveRecord::Migration[5.2]
  def change
    create_table :cc_rucs do |t|
      t.references :ruc, foreign_key: true
      t.references :case_coordination, foreign_key: true

      t.timestamps
    end
  end
end
