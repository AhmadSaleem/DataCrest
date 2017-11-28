class AddForeignKeyToPlannedEvents < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :planned_events, :human_service_applications, on_delete: :cascade
  end
end
