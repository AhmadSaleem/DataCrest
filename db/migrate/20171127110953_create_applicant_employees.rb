class CreateApplicantEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :applicant_employees do |t|
      t.references :human_service_applications, foreign_key: true

      t.integer :profession
      t.integer :employee_type
      t.string  :others_description
      t.integer :count

      t.timestamps
    end
  end
end
