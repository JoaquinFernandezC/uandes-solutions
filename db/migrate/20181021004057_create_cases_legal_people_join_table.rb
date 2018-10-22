class CreateCasesLegalPeopleJoinTable < ActiveRecord::Migration[5.2]
  def change
  	create_join_table :causes, :legal_people do |t|
    end
  end
end
