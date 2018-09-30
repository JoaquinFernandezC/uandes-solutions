class CreateMemberIics < ActiveRecord::Migration[5.2]
  def change
    create_table :member_iics do |t|
      t.references :iic, foreign_key: true
      t.references :employee, foreign_key: true

      t.timestamps
    end
  end
end
