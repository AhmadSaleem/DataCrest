class Dashboard::SalespeopleInvitationsController < ApplicationController
  before_action :authenticate_salesperson!
  before_action :authorize_salesperson

  def index
    @salespeople = current_salesperson.invited_salespeople.page(params[:page])
    @salesperson = Salesperson.new
  end

  def create
    result = SendSalespersonInvite.new(params: saleperson_params, sender: current_salesperson).call
    if result
      flash[:notice] = "Invitation was sent successfully"
    else
      flash[:alert] = "The Salesperson already belongs to a company."
    end
    redirect_to dashboard_salespeople_invitations_path
  end

  def resend_invitation
    result = SendSalespersonInvite.new(sender: current_salesperson).resend_invite(params[:id])
    if result
      flash[:notice] = "Invitation was resent successfully"
    else
      flash[:alert] = "The Salesperson does not exist."
    end
    redirect_to dashboard_salespeople_invitations_path
  end

  def destroy
    salesperson = Salesperson.find(params[:id])
    salesperson.destroy
    redirect_to dashboard_salespeople_invitations_path, notice: "Salesperson was removed successfully"
  end

  private

  def saleperson_params
    params.require(:salesperson).permit(:first_name, :last_name, :email)
  end

  def authorize_salesperson
    redirect_to root_path, alert: 'You are not authorized' unless current_salesperson.company_owner?
  end
end
