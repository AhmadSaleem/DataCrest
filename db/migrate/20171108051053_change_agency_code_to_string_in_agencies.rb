class ChangeAgencyCodeToStringInAgencies < ActiveRecord::Migration[5.1]
  def up
    change_column :agencies, :agency_code, :string, null: false
  end

  def down
    change_column :agencies, :agency_code, "integer USING CAST(agency_code AS integer)", null: false
  end
end
