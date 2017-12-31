class ModifyApplications < ActiveRecord::Migration[5.1]
  def change
    add_column    :applications, :client_application_id,   :integer
    add_column    :applications, :client_application_type, :string
    remove_column :applications, :class_name, :string,     null: false
    remove_column :applications, :title,      :string,     null: false
  end
end
