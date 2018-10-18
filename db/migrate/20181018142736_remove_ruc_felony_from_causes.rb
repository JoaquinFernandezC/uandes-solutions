class RemoveRucFelonyFromCauses < ActiveRecord::Migration[5.2]
  def change
    remove_column :causes, :ruc_felony_id
  end
end
