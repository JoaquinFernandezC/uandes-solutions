class CreateRucsFeloniesJoinTable < ActiveRecord::Migration[5.2]
  def change
  	create_join_table :rucs, :felonies do |t|
    end
  end
end
