class CreateLogEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :log_entries do |t|
      t.references :log, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :privacy
      t.text :message

      t.timestamps
    end
  end
end
