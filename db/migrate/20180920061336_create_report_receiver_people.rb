class CreateReportReceiverPeople < ActiveRecord::Migration[5.2]
  def change
    create_table :report_receiver_people do |t|
      t.references :derivation, foreign_key: true
      t.references :people, foreign_key: true

      t.timestamps
    end
  end
end
