class AddColumnTemplatesCountToAgents < ActiveRecord::Migration[5.1]
  def change
    add_column :agents, :applications_count, :integer, default: 0
  end
end
