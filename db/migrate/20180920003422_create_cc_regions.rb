class CreateCcRegions < ActiveRecord::Migration[5.2]
  def change
    create_table :cc_regions do |t|
      t.references :regional_pros_office, foreign_key: true
      t.references :case_coordination, foreign_key: true

      t.timestamps
    end
  end
end
