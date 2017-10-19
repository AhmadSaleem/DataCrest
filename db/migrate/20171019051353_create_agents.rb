class CreateAgents < ActiveRecord::Migration[5.1]
  def change
    create_table :agents do |t|
      t.references :agency

      t.timestamps
    end
  end
end
