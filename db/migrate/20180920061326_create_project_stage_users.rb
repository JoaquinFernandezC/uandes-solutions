class CreateProjectStageUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :project_stage_users do |t|
      t.references :user, foreign_key: true
      t.references :project_stage, foreign_key: true

      t.timestamps
    end
  end
end
