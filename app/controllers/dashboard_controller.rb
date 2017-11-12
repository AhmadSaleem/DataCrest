class DashboardController < ActionController::Base
  layout "dashboard"
  include ApplicationHelper

  def index
    @title = 'Dashboard Home'
    @agent_templates = current_agent.templates.order_latest.page(params[:page]) if agent_signed_in?
  end
end
