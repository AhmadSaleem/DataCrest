class Dashboard::PagesController < ApplicationController
  def index
    @agent_templates = current_agent.templates.order_latest.page(params[:page]) if agent_signed_in?
  end
end
