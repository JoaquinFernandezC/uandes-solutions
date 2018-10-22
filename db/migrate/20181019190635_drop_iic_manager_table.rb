class DropIicManagerTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :iic_managers
  end
end
