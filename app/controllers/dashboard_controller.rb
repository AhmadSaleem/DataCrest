class DashboardController < ApplicationController
  before_action :set_public_application_path

  layout "dashboard"
  include ApplicationHelper

  def index
    @title = 'Dashboard Home'
    @agent_templates = current_agent.templates.order_latest.page(params[:page]) if agent_signed_in?
  end

  def set_public_application_path
    session[:application_url] = params if action_name == "new" && controller_name == "jimcor_dwelling_applications"
  end
end
