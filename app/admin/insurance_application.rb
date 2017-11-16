ActiveAdmin.register InsuranceApplication do
  permit_params :template_id, :client_application_type, :status

  index do
    selectable_column
    column :template
    column "Client" do |application|
      application.client_full_name
    end
    column "Wholesaler" do |application|
      link_to(application.template_wholesaler.title, admin_wholesaler_path(application.template_wholesaler.id))
    end
    column "Agent" do |application|
      application.agent.present? ? application.agent.full_name : 'N/A'
    end
    column :status
    column :client_application
    actions
  end

end
