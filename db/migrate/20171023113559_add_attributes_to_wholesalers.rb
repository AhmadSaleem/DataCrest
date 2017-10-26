class AddAttributesToWholesalers < ActiveRecord::Migration[5.1]
  def change
    add_column :wholesalers, :logo, :json
    add_column :wholesalers, :website, :string
    add_column :wholesalers, :city, :string
    add_column :wholesalers, :state, :string
    add_column :wholesalers, :zip_code, :string
    add_column :wholesalers, :address_1, :string
    add_column :wholesalers, :address_2, :string
  end
end
