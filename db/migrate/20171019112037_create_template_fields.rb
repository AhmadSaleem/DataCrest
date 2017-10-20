class CreateTemplateFields < ActiveRecord::Migration[5.1]
  def change
    create_table :template_fields do |t|
      t.belongs_to :application_template, null: false
      t.string     :field,                null: false
      t.integer    :field_type,           null: false

      t.timestamps
    end
  end
end
