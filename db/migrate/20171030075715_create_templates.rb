class CreateTemplates < ActiveRecord::Migration[5.1]
  def change
    create_table :templates do |t|
      t.references :wholesaler, index: true
      t.string     :class_name, null:  false
      t.string     :title,      null:  false

      t.timestamps
    end
  end
end
