class CreateDerivationTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :derivation_tasks do |t|
      t.references :derivation, foreign_key: true
      t.references :task, foreign_key: true

      t.timestamps
    end
  end
end
