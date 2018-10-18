class AddRucToCauses < ActiveRecord::Migration[5.2]
  def change
    add_reference :causes, :ruc, foreign_key: true
  end
end
