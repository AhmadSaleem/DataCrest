class RenameApplicationsToInsuranceApplications < ActiveRecord::Migration[5.1]
  def change
    rename_table :applications, :insurance_applications
  end
end
