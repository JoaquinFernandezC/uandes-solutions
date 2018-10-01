class CreateDerivationReports < ActiveRecord::Migration[5.2]
  def change
    create_table :derivation_reports do |t|
      t.references :derivation, foreign_key: true
      t.date :report_date
      t.string :subject
      t.integer :identifier_number
      t.string :action_course

      t.timestamps
    end
  end
end
