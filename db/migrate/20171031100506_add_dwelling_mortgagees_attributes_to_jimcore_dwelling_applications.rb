class AddDwellingMortgageesAttributesToJimcoreDwellingApplications < ActiveRecord::Migration[5.1]
  def change
    add_column :jimcor_dwelling_applications, :mortgage_loan_number, :integer
    add_column :jimcor_dwelling_applications, :mortgage_address, :string
    add_column :jimcor_dwelling_applications, :mortgage_name, :string
    add_column :jimcor_dwelling_applications, :mortgage_lending_organization, :boolean, default: false

    add_column :jimcor_dwelling_applications, :mortgage_2_loan_number, :integer
    add_column :jimcor_dwelling_applications, :mortgage_2_address, :string
    add_column :jimcor_dwelling_applications, :mortgage_2_name, :string
    add_column :jimcor_dwelling_applications, :mortgage_2_lending_organization, :boolean, default: false
  end
end
