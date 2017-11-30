class AddColumnToHumanServiceApplications < ActiveRecord::Migration[5.1]
  def change
    add_column :human_service_applications, :percentage_of_completion, :integer, default: 0
  end
end
