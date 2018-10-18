class ChageManagerIicsToIccManagers < ActiveRecord::Migration[5.2]
  def change
    rename_table :manager_iics, :iic_managers
  end
end
