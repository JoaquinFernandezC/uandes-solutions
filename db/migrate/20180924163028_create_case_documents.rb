class CreateCaseDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :case_documents do |t|
      t.references :document, foreign_key: true
      t.references :cause, foreign_key: true

      t.timestamps
    end
  end
end
