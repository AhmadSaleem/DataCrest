class Clients::SessionsController < Devise::SessionsController
  def create
    @user = Client.find_by(email: params[:client][:email])
    if @user && @user.valid_password?(params[:client][:password])
      sign_in("client", @user)
      flash[:notice] = "Logged in successfully"
    else
      flash.now[:alert] = "Email or password is incorrect."
    end
    respond_to do |format|
      format.js
    end
  end
end
