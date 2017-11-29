class AddAgentToHumanServiceApplications < ActiveRecord::Migration[5.1]
  def change
    add_reference :human_service_applications, :agent, index: true
    add_foreign_key :human_service_applications, :agents, on_delete: :cascade
  end
end
