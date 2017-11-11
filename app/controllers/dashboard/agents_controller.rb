class Dashboard::AgentsController < DashboardController
  before_action :authenticate_salesperson!
  before_action :set_agent, only: [:show]

  def index
    @agents = current_salesperson.wholesaler_agents.page(params[:page])
  end

  def show
  end

  private

  def set_agent
    @agent = Agent.find(params[:id])
  end
end
