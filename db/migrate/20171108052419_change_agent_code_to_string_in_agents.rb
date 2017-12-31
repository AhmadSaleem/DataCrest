class ChangeAgentCodeToStringInAgents < ActiveRecord::Migration[5.1]
 def up
    change_column :agents, :agent_code, :string, null: false
  end

  def down
    change_column :agents, :agent_code, "integer USING CAST(agent_code AS integer)", null: false
  end
end
