class CreateDerivationsUserReportsJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_table :derivations_user_reports, id: false do |t|
      t.integer :user_id
      t.integer :derivation_id
    end

    add_index :derivations_user_reports, :user_id
    add_index :derivations_user_reports, :derivation_id
  end
end
