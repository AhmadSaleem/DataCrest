class RemoveNullConstraintFromAgentCodeAndAgencyCode < ActiveRecord::Migration[5.1]
  def up
    change_column :agents, :agent_code, :string, null: true
    change_column :agencies, :agency_code, :string, null: true
  end

  def down
    change_column :agents, :agent_code, :string, null: false
    change_column :agencies, :agency_code, :string, null: false
  end
end
