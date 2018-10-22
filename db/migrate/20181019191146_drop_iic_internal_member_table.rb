class DropIicInternalMemberTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :iic_internal_members
  end
end
