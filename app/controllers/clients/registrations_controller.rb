class Clients::RegistrationsController < Devise::RegistrationsController
  layout "dashboard", only: [:edit, :update]

  def new
    super
  end

  def create
    @client = Client.find_by(email: sign_up_params[:email])
    if @client.present? && @client.invitation_sent_at? && !@client.invitation_accepted_at?
      @alert = "Please check your email you are already invited or ask the agent to reinvite you."
    else
      @client = build_resource(sign_up_params)
      if @client.save
        flash[:notice] = "Welcome! Successfully signed up."
        sign_up("client", @client)
        UserMailer.welcome(@client.email).deliver_later
      else
        clean_up_passwords @client
        set_minimum_password_length
      end
    end
    respond_to do |format|
      format.html {
        flash[:alert] = @alert if @alert
        return redirect_to(dashboard_path) if @client.persisted?
        render :new
      }
      format.js {
        flash.now[:alert] = @alert if @alert
        render :create
      }
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
