class CreateApplications < ActiveRecord::Migration[5.1]
  def change
    create_table :applications do |t|
      t.references :client
      t.references :agent
      t.references :application_template
      t.boolean    :status, default: false

      t.timestamps
    end
  end
end
