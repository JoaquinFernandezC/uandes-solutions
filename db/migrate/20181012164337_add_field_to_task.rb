class AddFieldToTask < ActiveRecord::Migration[5.2]
  def change
    add_reference :tasks, :log, foreign_key: true
  end
end
