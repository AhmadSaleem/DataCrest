class Dashboard::AgentsController < DashboardController
  before_action :authenticate_salesperson!
  before_action :set_agent, only: [:show]

  def index
    @title = "Agents"
    @agents = current_salesperson.wholesaler_agents.page(params[:page])
  end

  def show
    @title = "Agent: #{@agent.full_name}"
  end

  private

  def set_agent
    @agent = Agent.find(params[:id])
  end
end
