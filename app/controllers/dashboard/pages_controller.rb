class Dashboard::PagesController < ApplicationController
  def index
    @agent_templates = current_agent.templates if agent_signed_in?
  end
end
