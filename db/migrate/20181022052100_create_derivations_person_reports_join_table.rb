class CreateDerivationsPersonReportsJoinTable < ActiveRecord::Migration[5.2]
  def change
  	create_join_table :derivations, :people do |t|
    end
  end
end
