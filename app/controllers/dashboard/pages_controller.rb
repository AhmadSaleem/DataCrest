class Dashboard::PagesController < ApplicationController
  def index
    @agent_templates = current_agent.templates.order_latest.page(params[:page]) if agent_signed_in?
  end

  def account_setting
    @company = current_salesperson.owned_wholesaler
    @employees = current_salesperson.owned_wholesaler_salespeople
  end
end
