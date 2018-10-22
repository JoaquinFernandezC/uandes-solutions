class ChangeGoalsTypesToDatetime < ActiveRecord::Migration[5.2]
  def change
    change_column :goals, :estimated_end_date, :datetime
    change_column :goals, :end_date, :datetime
  end
end
