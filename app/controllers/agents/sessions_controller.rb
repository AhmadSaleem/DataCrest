class Agents::SessionsController < Devise::SessionsController
  def new
    super
  end

  def create
    super
    if params[:agent][:accept_invite] == "true"
      flash[:notice] = "Thank you for accepting the invite."
    else
      flash[:notice] = "Welcome back."
    end
  end
end
