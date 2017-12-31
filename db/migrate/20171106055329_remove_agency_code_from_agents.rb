class RemoveAgencyCodeFromAgents < ActiveRecord::Migration[5.1]
  def change
    remove_column :agents, :agency_code, :integer
  end
end
