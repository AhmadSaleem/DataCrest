class Agents::RegistrationsController < Devise::RegistrationsController
  layout "dashboard", only: [:edit, :update]

  def create
    super
    UserMailer.welcome(resource.email).deliver_later if resource.persisted?
  end

  private

    def sign_up_params
      params.require(:agent).permit(:first_name, :last_name, :email, :password, :password_confirmation, :profile_picture, :profile_picture_cache ,owned_agency_attributes: [:title])
    end

    def account_update_params
      params.require(:agent).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :profile_picture, :profile_picture_cache)
    end

    def after_update_path_for(resource)
      dashboard_path
    end
end
