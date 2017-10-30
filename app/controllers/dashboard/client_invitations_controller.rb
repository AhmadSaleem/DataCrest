class Dashboard::ClientInvitationsController < ApplicationController
  before_action :authenticate_agent!
  before_action :fields_validation, only: [:create]

  def new
    @client = Client.new
    @clients = Client.invitation_accepted
    @templates = current_agent.templates
  end

  def create
    params[:new][:client] == "no" ? invite_existing_client : invite_new_client
  end

  private

    def client_params
      params.require(:client).permit(:first_name, :last_name, :email)
    end

    def invite_new_client
      if SendClientInvite.new(params: client_params, sender: current_agent, selected_templates: params[:template_ids]).new_client
        redirect_to new_dashboard_client_invitation_path, notice: "Invitation was sent successfully"
      else
        redirect_to new_dashboard_client_invitation_path, alert: "The client already registered."
      end
    end

    def invite_existing_client
      if SendClientInvite.new(params: params[:clients], sender: current_agent, selected_templates: params[:template_ids]).existing_client
        redirect_to new_dashboard_client_invitation_path, notice: "Invitation was sent successfully"
      else
        redirect_to new_dashboard_client_invitation_path, alert: "Something went wroung."
      end
    end

    def fields_validation
      # params[:new][:client] == "no" for existing client

      if params[:new][:client] == "no" && params[:clients].blank?
        redirect_to new_dashboard_clent_invitation_path, alert: "Please select an client"
      elsif (client_params[:first_name].blank? || client_params[:last_name].blank? || client_params[:email].blank?) && params[:new][:client] == "yes"
        redirect_to new_dashboard_client_invitation_path, alert: "Invite fields cannot be blank."
      end
    end
end
