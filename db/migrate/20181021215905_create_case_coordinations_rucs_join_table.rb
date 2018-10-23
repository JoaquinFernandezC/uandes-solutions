class CreateCaseCoordinationsRucsJoinTable < ActiveRecord::Migration[5.2]
  def change
  	create_join_table :case_coordinations, :rucs do |t|
    end
  end
end
