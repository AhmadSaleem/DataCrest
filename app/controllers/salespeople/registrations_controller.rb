class Salespeople::RegistrationsController < Devise::RegistrationsController

  def create
    super
  end

  private

    def sign_up_params
      params.require(:salesperson).permit(:first_name, :last_name, :email, :password, :password_confirmation,
                                          owned_wholesaler_attributes: [:title])
    end
end
