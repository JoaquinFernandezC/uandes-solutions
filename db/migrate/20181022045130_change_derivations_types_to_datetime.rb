class ChangeDerivationsTypesToDatetime < ActiveRecord::Migration[5.2]
  def change
    change_column :derivations, :derivation_date, :datetime
    change_column :derivations, :estimated_end_date, :datetime
    change_column :derivations, :end_date, :datetime
    change_column :derivations, :estimated_work_start_date, 'timestamp USING CAST(estimated_work_start_date AS timestamp)'
  end
end
