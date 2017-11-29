class AddClientToHumanServiceApplications < ActiveRecord::Migration[5.1]
  def change
    add_reference :human_service_applications, :client, index: true
    add_foreign_key :human_service_applications, :clients, on_delete: :cascade
  end
end
