class AddFieldToProject < ActiveRecord::Migration[5.2]
  def change
    add_reference :projects, :log, foreign_key: true
  end
end
