class CreateApplications < ActiveRecord::Migration[5.1]
  def change
    create_table :applications do |t|
      t.belongs_to :wholesaler, index: true
      t.string     :title,      null:  false
      t.string     :model_name, null:  false

      t.timestamps
    end
  end
end
