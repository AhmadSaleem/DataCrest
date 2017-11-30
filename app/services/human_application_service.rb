class HumanApplicationService
  def self.create_application(template_id, current_client)
    template = Template.find_by(id: template_id)
    if current_client && template.present?
      human_service_application = current_client.human_service_applications.first_or_create
      template.insurance_applications.find_or_create_by(client_application: human_service_application)
    else
      human_service_application = HumanServiceApplication.new
    end

    (28 - human_service_application.applicant_employees.count).times do
      human_service_application.applicant_employees.build
    end
    (10 - human_service_application.planned_events.count).times do
      human_service_application.planned_events.build
    end

    return human_service_application
  end
end
