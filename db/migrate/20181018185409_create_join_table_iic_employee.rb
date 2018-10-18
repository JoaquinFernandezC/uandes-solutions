class CreateJoinTableIicEmployee < ActiveRecord::Migration[5.2]
  def change
    create_join_table :iics, :employees do |t|
      # t.index [:iic_id, :employee_id]
      # t.index [:employee_id, :iic_id]
    end
  end
end
