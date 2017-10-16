class CreateSalespeople < ActiveRecord::Migration[5.1]
  def change
    create_table :salespeople do |t|
      t.belongs_to :wholesaler, null: false, index: true

      t.timestamps
    end
  end
end
