class CreatePrivacyLevels < ActiveRecord::Migration[5.2]
  def change
    create_table :privacy_levels do |t|
      t.string :tag

      t.timestamps
    end
  end
end
