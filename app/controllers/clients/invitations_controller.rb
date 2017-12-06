class Clients::InvitationsController < Devise::InvitationsController
  before_action :set_application_path, only: [:update]

  def edit
    super
  end

  def update
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
