class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_public_application_path

  protected
    def after_sign_in_path_for(resource)
      session[:application_url] || session[:public_application_url] || dashboard_path
    end

    def set_public_application_path
      session[:public_application_url] = params if params[:action] == "create_application"
    end
end
