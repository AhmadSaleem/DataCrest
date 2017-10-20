class AddForeignKeysToApplications < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :applications, :clients,               on_delete: :cascade
    add_foreign_key :applications, :agents,                on_delete: :cascade
    add_foreign_key :applications, :application_templates, on_delete: :cascade
  end
end
