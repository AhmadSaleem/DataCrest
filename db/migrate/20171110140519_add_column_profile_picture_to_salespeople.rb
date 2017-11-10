class AddColumnProfilePictureToSalespeople < ActiveRecord::Migration[5.1]
  def change
    add_column :salespeople, :profile_picture, :json
  end
end
