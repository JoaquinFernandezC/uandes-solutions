class CreateCaseCoordinationsLegalPeopleJoinTable < ActiveRecord::Migration[5.2]
  def change
  	create_join_table :case_coordinations, :legal_people do |t|
    end
  end
end
