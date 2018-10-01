class CreateProjectTaskDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :project_task_documents do |t|
      t.references :document, foreign_key: true
      t.references :project_task, foreign_key: true

      t.timestamps
    end
  end
end
