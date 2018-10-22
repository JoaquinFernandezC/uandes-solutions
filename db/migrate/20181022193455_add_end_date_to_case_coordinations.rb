class AddEndDateToCaseCoordinations < ActiveRecord::Migration[5.2]
  def change
    add_column :case_coordinations, :end_date, :datetime
  end
end
