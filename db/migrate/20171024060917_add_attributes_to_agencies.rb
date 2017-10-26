class AddAttributesToAgencies < ActiveRecord::Migration[5.1]
  def change
    add_column    :agencies, :logo, :json
    add_column    :agencies, :address_2, :string
    rename_column :agencies, :street, :address_1
  end
end
