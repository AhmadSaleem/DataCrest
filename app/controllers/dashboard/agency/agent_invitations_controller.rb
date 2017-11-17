class Dashboard::Agency::AgentInvitationsController < DashboardController
  before_action :authenticate_agent!
  before_action :authorize_agent

  def index
    @title = 'Manage Employees'
    @agents = current_agent.invited_agents.page(params[:page])
    @agent = Agent.new
  end

  def create
    result = Agency::SendAgentInvite.new(params: agent_params, sender: current_agent).call
    if result
      flash[:notice] = "Invitation was sent successfully"
    else
      flash[:alert] = "The Agent already belongs to a agency."
    end
    redirect_to dashboard_agency_agent_invitations_path
  end

  def resend_invitation
    result = Agency::SendAgentInvite.new(sender: current_agent).resend_invite(params[:id])
    if result
      flash[:notice] = "Invitation was resent successfully"
    else
      flash[:alert] = "The Agent does not exist."
    end
    redirect_to dashboard_agency_agent_invitations_path
  end

  def destroy
    agent = Agent.find(params[:id])
    agent.destroy
    redirect_to dashboard_agency_agent_invitations_path, notice: "Agent was removed successfully"
  end

  private

  def agent_params
    params.require(:agent).permit(:agent_code ,:first_name, :last_name, :email)
  end

  def authorize_agent
    redirect_to dashboard_path, alert: 'You are not authorized' unless current_agent.company_owner?
  end
end
