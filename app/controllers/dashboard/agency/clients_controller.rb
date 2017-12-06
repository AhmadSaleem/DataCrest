class Dashboard::Agency::ClientsController < DashboardController
  before_action :authenticate_agent!

  def index
    @title = "Clients"
    @agent_clients = current_agent.agent_clients.page(params[:page])
  end
end
