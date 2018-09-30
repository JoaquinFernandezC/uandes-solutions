class CreateRegionalProsOffices < ActiveRecord::Migration[5.2]
  def change
    create_table :regional_pros_offices do |t|
      t.string :region
      t.references :prosecutor, foreign_key: true

      t.timestamps
    end
  end
end
