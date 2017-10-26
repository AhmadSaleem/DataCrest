class CreateAgentWholesalers < ActiveRecord::Migration[5.1]
  def change
    create_table :agent_wholesalers do |t|
      t.references :agent, foreign_key: true
      t.references :wholesaler, foreign_key: true
      t.integer    :status, default: 0

      t.timestamps
    end
  end
end
