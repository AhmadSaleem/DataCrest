class Dashboard::AgentInvitationsController < ApplicationController
  before_action :authenticate_salesperson!
  before_action :fields_validation, only: [:create]

  def new
    @agents = Agent.invitation_accepted
    @agent = Agent.new
    @applications = current_salesperson.wholesaler_applications
  end

  def create
    params[:new][:agent] == "no" ? invite_existing_agent : invite_new_agent
  end

  private

    def agent_params
      params.require(:agent).permit(:first_name, :last_name, :email)
    end

    def invite_new_agent
      if SendAgentInvite.new(params: agent_params, sender: current_salesperson, selected_applications: params[:application_ids]).new_agent
        redirect_to new_dashboard_agent_invitation_path, notice: "Invitation was sent successfully"
      else
        redirect_to new_dashboard_agent_invitation_path, alert: "The Agent already registered."
      end
    end

    def invite_existing_agent
      if SendAgentInvite.new(params: params[:agents], sender: current_salesperson, selected_applications: params[:application_ids]).existing_agent
        redirect_to new_dashboard_agent_invitation_path, notice: "Invitation was sent successfully"
      else
        redirect_to new_dashboard_agent_invitation_path, alert: "Something went wroung."
      end
    end

    def fields_validation
      #params[:new][:agent] == "no" for existing agent
      if params[:new][:agent] == "no" && params[:agents].blank?
        redirect_to new_dashboard_agent_invitation_path, alert: "Please select an agent"
      elsif (agent_params[:first_name].blank? || agent_params[:last_name].blank? || agent_params[:email].blank?) && params[:new][:agent] == "yes"
        redirect_to new_dashboard_agent_invitation_path, alert: "Invite fields cannot be blank."
      end
    end
end
