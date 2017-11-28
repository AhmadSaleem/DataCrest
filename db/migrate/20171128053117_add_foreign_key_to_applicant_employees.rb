class AddForeignKeyToApplicantEmployees < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :applicant_employees, :human_service_applications, on_delete: :cascade
  end
end
