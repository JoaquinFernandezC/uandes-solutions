class CreateJoinTableIicManager < ActiveRecord::Migration[5.2]
  def change
    create_join_table :iics, :users do |t|
      # t.index [:iic_id, :user_id]
      # t.index [:user_id, :iic_id]
    end
  end
end
