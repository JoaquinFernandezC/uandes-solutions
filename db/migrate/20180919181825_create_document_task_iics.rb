class CreateDocumentTaskIics < ActiveRecord::Migration[5.2]
  def change
    create_table :document_task_iics do |t|
      t.references :task_iic, foreign_key: true
      t.references :document, foreign_key: true

      t.timestamps
    end
  end
end
