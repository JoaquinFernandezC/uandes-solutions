class AddFieldToCaseCoordination < ActiveRecord::Migration[5.2]
  def change
    add_reference :case_coordinations, :log, foreign_key: true
  end
end
