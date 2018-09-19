class CreateInternalMemberIics < ActiveRecord::Migration[5.2]
  def change
    create_table :internal_member_iics do |t|
      t.references :iic, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
