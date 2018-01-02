class ChangeZipCodeToStringInAgencies < ActiveRecord::Migration[5.1]
  def up
    change_column :agencies, :zip_code, :string
  end

  def down
    change_column :agencies, :zip_code, "integer USING CAST(zip_code AS integer)"
  end
end
