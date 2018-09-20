class CreateDerivationTaskDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :derivation_task_documents do |t|
      t.references :derivation_task, foreign_key: true
      t.references :document, foreign_key: true

      t.timestamps
    end
  end
end
