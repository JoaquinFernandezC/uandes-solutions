class CreateGoalDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :goal_documents do |t|
      t.references :goal, foreign_key: true
      t.references :document, foreign_key: true

      t.timestamps
    end
  end
end
