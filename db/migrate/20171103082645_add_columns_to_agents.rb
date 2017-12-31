class AddColumnsToAgents < ActiveRecord::Migration[5.1]
  def change
    add_column :agents, :agency_code, :integer, null: false
    add_column :agents, :agent_code,  :integer, null: false
  end
end
