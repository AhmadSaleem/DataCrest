class CreateApplicationTemplates < ActiveRecord::Migration[5.1]
  def change
    create_table :application_templates do |t|
      t.references :wholesaler, null: false
      t.string     :title, null: false, unique: true
      t.string     :keys,  array: true, default: []

      t.timestamps
    end
  end
end
