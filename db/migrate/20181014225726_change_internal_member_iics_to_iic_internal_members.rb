class ChangeInternalMemberIicsToIicInternalMembers < ActiveRecord::Migration[5.2]
  def change
    rename_table :internal_member_iics, :iic_internal_members
  end
end
