class ChangeRolToBeIntegerInUsers < ActiveRecord::Migration[5.2]
  def change
  	change_column :users, :rol, 'integer USING CAST(rol AS integer)'
  end
end
