class AddProfilePicToClients < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :profile_pic, :json
  end
end
