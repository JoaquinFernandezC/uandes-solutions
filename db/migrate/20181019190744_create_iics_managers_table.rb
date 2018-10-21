class CreateIicsManagersTable < ActiveRecord::Migration[5.2]
  def change
    create_table :iics_managers, id: false do |t|
      t.integer :user_id
      t.integer :iic_id
    end

    add_index :iics_managers, :user_id
    add_index :iics_managers, :iic_id
  end
end
