class CreateDerivationDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :derivation_documents do |t|
      t.references :derivation, foreign_key: true
      t.references :document, foreign_key: true

      t.timestamps
    end
  end
end
