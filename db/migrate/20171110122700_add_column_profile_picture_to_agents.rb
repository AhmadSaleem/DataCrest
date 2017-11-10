class AddColumnProfilePictureToAgents < ActiveRecord::Migration[5.1]
  def change
    add_column :agents, :profile_picture, :json
  end
end
