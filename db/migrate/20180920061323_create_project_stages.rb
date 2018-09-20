class CreateProjectStages < ActiveRecord::Migration[5.2]
  def change
    create_table :project_stages do |t|
      t.references :project, foreign_key: true
      t.integer :stage_number
      t.text :description

      t.timestamps
    end
  end
end
