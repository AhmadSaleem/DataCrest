class Clients::RegistrationsController < Devise::RegistrationsController
  layout "dashboard", only: [:edit, :update]

  def new
    super
  end

  def create
    client = Client.find_by(email: sign_up_params[:email])
    if client.present? && client.invitation_sent_at? && !client.invitation_accepted_at?
      redirect_to new_client_registration_path, alert: "Please check your email you are already invited or ask the agent to reinvite you."
    else
      super
      UserMailer.welcome(resource.email).deliver_later if resource.persisted?
    end
  end

  private

    def sign_up_params
      params.require(:client).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

    def account_update_params
      params.require(:client).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :profile_picture, :profile_picture_cache)
    end
end
