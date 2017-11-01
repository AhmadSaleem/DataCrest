class Agents::RegistrationsController < Devise::RegistrationsController

  def create
    super
    UserMailer.welcome(resource.email).deliver_later if resource.persisted?
  end

  private

    def sign_up_params
      params.require(:agent).permit(:first_name, :last_name, :email, :password, :password_confirmation, owned_agency_attributes: [:title])
    end

    def account_update_params
      params.require(:agent).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
    end
end
