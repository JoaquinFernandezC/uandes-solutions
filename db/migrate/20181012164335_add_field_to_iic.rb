class AddFieldToIic < ActiveRecord::Migration[5.2]
  def change
    add_reference :iics, :log, foreign_key: true
  end
end
