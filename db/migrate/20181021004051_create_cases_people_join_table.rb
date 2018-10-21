class CreateCasesPeopleJoinTable < ActiveRecord::Migration[5.2]
  def change
  	create_join_table :causes, :people do |t|
    end
  end
end
