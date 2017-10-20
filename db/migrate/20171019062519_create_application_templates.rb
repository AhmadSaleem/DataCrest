class CreateApplicationTemplates < ActiveRecord::Migration[5.1]
  def change
    create_table :application_templates do |t|
      t.references :wholesaler, null: false
      t.string     :title, null: false, unique: true

      t.timestamps
    end
  end
end
