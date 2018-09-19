class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
      t.string :name
      t.integer :version
      t.string :classification
      t.string :type
      t.string :log

      t.timestamps
    end
  end
end
