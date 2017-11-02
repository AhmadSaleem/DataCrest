class Dashboard::ApplicationsController < ApplicationController
  before_action :authenticate_salesperson!
  before_action :set_application, only: [:show, :edit, :update]

  def index
    @wholesaler_applications = current_salesperson.wholesaler_applications.page(params[:page])
  end

  def show
    @jimcor_dwelling_application = @application.client_application
    render 'dashboard/jimcor_dwelling_applications/show'
  end

  def edit
  end

  def update
    if @application.update(update_params)
      redirect_to dashboard_applications_path, notice: "Status was updated successfully."
    else
      render :edit
    end
  end

  private

  def set_application
    @application = Application.find(params[:id])
  end

  def update_params
    params.require(:application).permit(:status)
  end
end
