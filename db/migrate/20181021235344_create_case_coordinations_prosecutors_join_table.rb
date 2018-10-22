class CreateCaseCoordinationsProsecutorsJoinTable < ActiveRecord::Migration[5.2]
  def change
  	create_join_table :case_coordinations, :prosecutors do |t|
    end
  end
end
