class CreateDerivationsUsersJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_table :derivations_users, id: false do |t|
      t.integer :user_id
      t.integer :derivation_id
    end

    add_index :derivations_users, :user_id
    add_index :derivations_users, :derivation_id
  end
end
