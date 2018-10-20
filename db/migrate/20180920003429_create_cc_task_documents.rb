class CreateCcTaskDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :cc_task_documents do |t|
      t.references :cc_task, foreign_key: true
      t.references :document, foreign_key: true

      t.timestamps
    end
  end
end
