class AddProfilePicToClients < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :clients, :json
  end
end
