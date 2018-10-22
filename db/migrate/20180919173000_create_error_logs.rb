class CreateErrorLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :error_logs do |t|
      t.string :code
      t.string :privacy
      t.string :action

      t.timestamps
    end
  end
end
