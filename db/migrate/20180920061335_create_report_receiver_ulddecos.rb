class CreateReportReceiverUlddecos < ActiveRecord::Migration[5.2]
  def change
    create_table :report_receiver_ulddecos do |t|
      t.references :derivation, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
