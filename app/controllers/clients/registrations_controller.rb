class Clients::RegistrationsController < Devise::RegistrationsController

  private

    def account_update_params
      params.require(:client).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
    end
end
