class Clients::InvitationsController < Devise::InvitationsController

  def update
    super
    if resource.invitation_accepted_at?
      UserMailer.welcome(resource.email).deliver_later
      AgentMailer.client_invite_accept(resource).deliver_later
    end
  end

  private

    def update_resource_params
      params.require(:client).permit(:password, :password_confirmation, :invitation_token)
    end
end
