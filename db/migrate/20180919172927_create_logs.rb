class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.string :code
      t.string :privacy
      t.string :action
      t.boolean :commentary

      t.timestamps
    end
  end
end
