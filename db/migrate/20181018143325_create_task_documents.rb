class CreateTaskDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :task_documents do |t|
      t.references :task, foreign_key: true
      t.references :document, foreign_key: true

      t.timestamps
    end
  end
end
