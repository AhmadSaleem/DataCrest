class Dashboard::AgentWholesalerApplicationsController < DashboardController
  before_action :set_agent, only: [:agent_templates]
  before_action :authenticate_salesperson!

  def index
    @title = 'Agents'
    @agent_wholesalers = current_salesperson.wholesaler_agents.page(params[:page])
  end

  def agent_templates
    @title = 'Agent Applications'
    @agent_templates = @agent.templates
  end

  def destroy
    template = AgencyApplication.find_by(template_id: params[:id], agent_id: params[:agent_id] )
    if template.destroy
      redirect_to agent_templates_dashboard_agent_wholesaler_application_path(params[:agent_id]), alert: "Successfully Removed"
    end
  end

  private
    def set_agent
      @agent = Agent.find_by(id: params[:id])
    end
end
