class Clients::InvitationsController < Devise::InvitationsController

  def edit
    super
  end

  def update
    if params[:client][:application_id].present?
      insurance_application = InsuranceApplication.find_by(id: params[:client][:application_id])
      session[:application_url] = { controller: "dashboard/insurance_applications/#{insurance_application.client_application_type.tableize}",
                                    action: "edit", id: insurance_application.client_application_id }
    end

    super

    if resource.invitation_accepted?
      UserMailer.welcome(resource.email).deliver_later
      AgentMailer.client_invite_accept(resource.id).deliver_later
    end
  end

  private

    def update_resource_params
      params.require(:client).permit(:password, :password_confirmation, :invitation_token)
    end
end
