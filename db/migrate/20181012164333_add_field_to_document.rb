class AddFieldToDocument < ActiveRecord::Migration[5.2]
  def change
    add_reference :documents, :log, foreign_key: true
  end
end
