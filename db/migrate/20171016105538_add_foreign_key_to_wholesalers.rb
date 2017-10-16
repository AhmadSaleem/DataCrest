class AddForeignKeyToWholesalers < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :wholesalers, :salespeople, column: "owner_id", on_delete: :cascade
  end
end
