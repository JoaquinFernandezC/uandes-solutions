class CreateCaseCoordinationsPeopleJoinTable < ActiveRecord::Migration[5.2]
  def change
  	create_join_table :case_coordinations, :people do |t|
    end
  end
end
