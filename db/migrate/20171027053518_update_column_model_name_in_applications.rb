class UpdateColumnModelNameInApplications < ActiveRecord::Migration[5.1]
  def change
    rename_column :applications, :model_name, :class_name
  end
end
