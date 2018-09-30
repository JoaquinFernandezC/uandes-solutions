class CreateProjectDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :project_documents do |t|
      t.references :project, foreign_key: true
      t.references :document, foreign_key: true

      t.timestamps
    end
  end
end
