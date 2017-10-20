class Dashboard::ApplicationsController < ApplicationController
  before_action :set_application, only: [:edit, :update]

  def edit
  end

  def update
    if @application.update(application_params.merge(status: true))
      redirect_to dashboard_application_path, notice: "Thank you for providing information"
    else
      render :edit
    end
  end

  def show
  end

  private

  def application_params
    params.require(:application).permit(:application_template_id, application_fields_attributes: [:id, :value])
  end

  def set_application
    @application = Application.find(params[:id])
  end
end
