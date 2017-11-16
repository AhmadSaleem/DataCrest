module Dashboard::InsuranceApplicationsHelper
  def render_application_edit_path(application)
    return edit_dashboard_insurance_application_path(application) if salesperson_signed_in?
    edit_dashboard_insurance_applications_jimcor_dwelling_application_path(application)
  end
end
