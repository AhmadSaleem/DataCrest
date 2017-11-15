class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected
    def after_sign_in_path_for(resource)
      if resource.model_name == "AdminUser"
        admin_dashboard_path
      else
        session[:application_url] || dashboard_path
      end
    end
end
