module Dashboard::InsuranceApplicationsHelper
  def render_view_path(application)
    return { controller: "dashboard/insurance_applications/#{application.template_class_name.tableize}",
           action: :show, id: application.id } if salesperson_signed_in?

           { controller: "dashboard/insurance_applications/#{application.insurance_application.template_class_name.tableize}",
           action: :show, id: application.id }

  end
end