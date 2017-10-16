class CreateWholesalers < ActiveRecord::Migration[5.1]
  def change
    create_table :wholesalers do |t|
      t.string  :title, null: false
      t.integer :owner_id, index: true, null: false

      t.timestamps
    end
  end
end
