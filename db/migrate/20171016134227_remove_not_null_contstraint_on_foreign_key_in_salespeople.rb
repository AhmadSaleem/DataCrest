class RemoveNotNullContstraintOnForeignKeyInSalespeople < ActiveRecord::Migration[5.1]
  def up
    change_column :salespeople, :wholesaler_id, :bigint, null: true
  end

  def down
    change_column :salespeople, :wholesaler_id, :bigint, null: false
  end
end
