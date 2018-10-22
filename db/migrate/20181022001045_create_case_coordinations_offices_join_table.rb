class CreateCaseCoordinationsOfficesJoinTable < ActiveRecord::Migration[5.2]
  def change
  	create_join_table :case_coordinations, :regional_pros_offices do |t|
    end
  end
end
