class RenameJimcorDwellingInsuranceApplications < ActiveRecord::Migration[5.1]
  def change
    rename_table :jimcor_dwelling_insurance_applications, :jimcor_dwelling_applications
  end
end
