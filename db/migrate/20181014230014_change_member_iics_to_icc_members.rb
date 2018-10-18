class ChangeMemberIicsToIccMembers < ActiveRecord::Migration[5.2]
  def change
    rename_table :member_iics, :iic_members
  end
end
