class CreateApplicationFields < ActiveRecord::Migration[5.1]
  def change
    create_table :application_fields do |t|
      t.references :application,    index: true, unique: true
      t.references :template_field, index: true
      t.string     :value,          null: true

      t.timestamps
    end
  end
end
