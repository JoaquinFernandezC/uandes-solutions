class CreateInternalAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :internal_authors do |t|
      t.references :user, foreign_key: true
      t.references :document, foreign_key: true

      t.timestamps
    end
  end
end
