class CreateIicsInternalMembersJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_table :iics_internal_members, id: false do |t|
      t.integer :user_id
      t.integer :iic_id
    end

    add_index :iics_internal_members, :user_id
    add_index :iics_internal_members, :iic_id
  end
end
