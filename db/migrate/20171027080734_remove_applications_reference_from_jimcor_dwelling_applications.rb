class RemoveApplicationsReferenceFromJimcorDwellingApplications < ActiveRecord::Migration[5.1]
  def change
    remove_reference :jimcor_dwelling_applications, :application
  end
end
