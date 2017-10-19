class AddForeginKeyToAgencies < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :agencies, :agents, column: "owner_id", on_delete: :cascade
  end
end
