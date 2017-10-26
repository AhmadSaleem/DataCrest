class UpdateJimcorDwellingApplications < ActiveRecord::Migration[5.1]
  def change
    add_reference :jimcor_dwelling_applications, :application, index: true
  end
end
