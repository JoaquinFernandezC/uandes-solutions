class CreateRucs < ActiveRecord::Migration[5.2]
  def change
    create_table :rucs do |t|
      t.integer :number

      t.timestamps
    end
  end
end
