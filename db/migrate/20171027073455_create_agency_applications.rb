class CreateAgencyApplications < ActiveRecord::Migration[5.1]
  def change
    create_table :agency_applications do |t|
      t.belongs_to :application, index: true
      t.belongs_to :agency,      index: true
      t.belongs_to :agent,       index: true

      t.timestamps
    end
  end
end
