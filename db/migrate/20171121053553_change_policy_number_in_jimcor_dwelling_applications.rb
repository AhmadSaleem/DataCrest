class ChangePolicyNumberInJimcorDwellingApplications < ActiveRecord::Migration[5.1]
  def up
    change_column :jimcor_dwelling_applications, :policy_number, :string
  end

  def down
    change_column :jimcor_dwelling_applications, :policy_number, "integer USING CAST(policy_number AS integer)"
  end
end
