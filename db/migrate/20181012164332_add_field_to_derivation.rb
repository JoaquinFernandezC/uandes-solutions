class AddFieldToDerivation < ActiveRecord::Migration[5.2]
  def change
    add_reference :derivations, :log, foreign_key: true
  end
end
