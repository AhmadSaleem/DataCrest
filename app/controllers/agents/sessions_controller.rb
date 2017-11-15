class Agents::SessionsController < Devise::SessionsController
  def create
    email = params[:agent][:email]
    user = Salesperson.find_by(email: email) || Agent.find_by(email: email) || Client.find_by(email: email)
    if user && user.valid_password?(params[:agent][:password])
      sign_in(user.class.name.downcase, user)
      if params[:agent] && params[:agent][:accept_invite] == "true"
        flash[:notice] = "Thank you for accepting the invite."
      else
        flash[:notice] = "Welcome back."
      end
      respond_with user, location: after_sign_in_path_for(user)
    else
      flash[:alert] = "Invalid email or password."
      self.resource = Agent.new
      render :new
    end
  end
end
