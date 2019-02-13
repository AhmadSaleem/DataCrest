class DropJimcorDwellingMortgagees < ActiveRecord::Migration[5.1]
  def up
    drop_table :jimcor_dwelling_mortgagees
  end

  def down
    create_table :jimcor_dwelling_mortgagees do |t|
      t.belongs_to :jimcor_dwelling_application, index: { name: "jimcor_dwelling_application_id" }

      t.integer :loan_number
      t.string  :name
      t.string  :address
      t.boolean :lending_organization, default: false

      t.timestamps
    end
  end
end
