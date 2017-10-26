class Agents::RegistrationsController < Devise::RegistrationsController
  private

    def account_update_params
      params.require(:agent).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
    end
end
