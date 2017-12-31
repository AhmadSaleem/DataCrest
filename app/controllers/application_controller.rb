class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected
    def after_sign_in_path_for(resource)
      session[:application_url] || dashboard_path
    end

  private

    def set_application_path
      if params[:application_id].present?
        insurance_application = InsuranceApplication.find_by(id: params[:application_id])
        session[:application_url] = { controller: "dashboard/insurance_applications/#{insurance_application.client_application_type.tableize}",
                                      action: "edit", id: insurance_application.client_application_id }
      end
    end
end
