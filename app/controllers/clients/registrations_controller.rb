class Clients::RegistrationsController < Devise::RegistrationsController

  def new
    redirect_to new_client_session_path
  end

  private

    def account_update_params
      params.require(:client).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
    end
end
