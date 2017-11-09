class Salespeople::RegistrationsController < Devise::RegistrationsController

  def create
    super
    UserMailer.welcome(resource.email).deliver_later if resource.persisted?
  end

  private

    def sign_up_params
      params.require(:salesperson).permit(:first_name, :last_name, :email, :password, :password_confirmation,
                                          owned_wholesaler_attributes: [:title, :logo, :website, :address_1, :address_2,
                                          :city, :state, :zip_code])
    end

    def account_update_params
      params.require(:salesperson).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
    end
end
