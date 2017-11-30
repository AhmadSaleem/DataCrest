module Dashboard::InsuranceApplicationsHelper
  def render_view_path(application)
    return { controller: "dashboard/insurance_applications/#{application.template_class_name.tableize}",
           action: :show, id: application.id } if salesperson_signed_in?

           { controller: "dashboard/insurance_applications/#{application.insurance_application.template_class_name.tableize}",
           action: :show, id: application.id }
  end

  def render_application_edit_path(application)
    return edit_dashboard_insurance_application_path(application) if salesperson_signed_in?
    return edit_dashboard_insurance_applications_jimcor_dwelling_application_path(application) if application.is_a?(JimcorDwellingApplication)
    edit_dashboard_insurance_applications_human_service_application_path(application)
  end
end
