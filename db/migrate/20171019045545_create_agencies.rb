class CreateAgencies < ActiveRecord::Migration[5.1]
  def change
    create_table :agencies do |t|
      t.string   :title,     null: false, unique: true
      t.integer  :owner_id,  null: false, index: true
      t.string   :website
      t.string   :street
      t.string   :city
      t.integer  :zip_code
      t.string   :state

      t.timestamps
    end
  end
end
