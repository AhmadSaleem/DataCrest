class AddForeginKeyToAgents < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :agents, :agencies, on_delete: :cascade
  end
end
