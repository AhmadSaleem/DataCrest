class AddForeignKeyToSalespeople < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :salespeople, :wholesalers, on_delete: :cascade
  end
end
