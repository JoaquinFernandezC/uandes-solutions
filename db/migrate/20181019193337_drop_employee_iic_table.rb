class DropEmployeeIicTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :employee_iics
  end
end
