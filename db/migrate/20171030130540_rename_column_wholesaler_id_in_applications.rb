class RenameColumnWholesalerIdInApplications < ActiveRecord::Migration[5.1]
  def change
    rename_column :applications, :wholesaler_id, :template_id
  end
end
