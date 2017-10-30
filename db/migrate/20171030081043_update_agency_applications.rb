class UpdateAgencyApplications < ActiveRecord::Migration[5.1]
  def change
    remove_reference :agency_applications, :application, index: true
    add_reference    :agency_applications, :template,    index: true
  end
end
