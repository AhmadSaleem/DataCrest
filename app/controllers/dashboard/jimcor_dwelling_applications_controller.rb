class Dashboard::JimcorDwellingApplicationsController < ApplicationController
  before_action :authenticate_client!
  before_action :set_jimcor_dwelling_application, only: [:edit, :update, :show]

  def index
    @jimcor_dwelling_applications = current_client.jimcor_dwelling_applications.page(params[:page])
  end

  def show
  end

  def edit
  end

  def update
    if @jimcor_dwelling_application.update(jimcor_dwelling_params)
      redirect_to dashboard_jimcor_dwelling_applications_path, notice: "Application was updated successfully."
    else
      render :edit
    end
  end

  private

    def set_jimcor_dwelling_application
      @jimcor_dwelling_application = JimcorDwellingApplication.find(params[:id])
    end

    def jimcor_dwelling_params
      params.require(:jimcor_dwelling_application).permit(ApplicationAttributes.jimcor_dwelling)
    end
end
