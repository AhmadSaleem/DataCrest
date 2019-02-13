class ChangeLoanNumberTypeInJimcorDwellingApplications < ActiveRecord::Migration[5.1]
  def up
    change_column :jimcor_dwelling_applications, :mortgage_loan_number,   :string
    change_column :jimcor_dwelling_applications, :mortgage_2_loan_number, :string
  end

  def down
    change_column :jimcor_dwelling_applications, :mortgage_loan_number, "integer USING CAST(mortgage_loan_number AS integer)"
    change_column :jimcor_dwelling_applications, :mortgage_2_loan_number, "integer USING CAST(mortgage_2_loan_number AS integer)"
  end
end
