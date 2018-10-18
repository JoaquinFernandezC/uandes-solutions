class AddEndDateToCauses < ActiveRecord::Migration[5.2]
  def change
    add_column :causes, :end_date, :datetime
  end
end
