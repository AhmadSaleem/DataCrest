class ModifyAgencies < ActiveRecord::Migration[5.1]
  def up
    add_column     :agencies, :agency_code, :integer, null: false
    change_column  :agencies, :title,       :string,  null: true
  end

  def down
    remove_column  :agencies, :agency_code, :integer
    change_column  :agencies, :title,       :string, null: false
  end
end
