class Dashboard::AgentInvitationsController < ApplicationController
  before_action :authenticate_salesperson!

  def new
    @agents = Agent.invitation_accepted
    @agent = Agent.new
  end

  def create
    params[:new][:agent] == "no" ? invite_existing_agent : invite_new_agent
  end

  private

    def agent_params
      params.require(:agent).permit(:first_name, :last_name, :email)
    end

    def invite_new_agent
      if SendAgentInvite.new(params: agent_params, sender: current_salesperson).new_agent
        redirect_to new_dashboard_agent_invitation_path, notice: "Invitation was sent successfully"
      else
        redirect_to new_dashboard_agent_invitation_path, alert: "The Agent already registered."
      end
    end

    def invite_existing_agent
      if SendAgentInvite.new(params: params[:agents], sender: current_salesperson).existing_agent
        redirect_to new_dashboard_agent_invitation_path, notice: "Invitation was sent successfully"
      else
        redirect_to new_dashboard_agent_invitation_path, alert: "Something went wroung."
      end
    end
end
