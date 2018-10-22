class ChangeProjectsTypesToDatetime < ActiveRecord::Migration[5.2]
  def change
    change_column :projects, :estimated_end_date, :datetime
    change_column :projects, :end_date, :datetime
  end
end
