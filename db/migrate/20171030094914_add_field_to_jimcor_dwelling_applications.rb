class AddFieldToJimcorDwellingApplications < ActiveRecord::Migration[5.1]
  def change
    add_column :jimcor_dwelling_applications, :percentage_of_completion, :integer, default: 0
  end
end
