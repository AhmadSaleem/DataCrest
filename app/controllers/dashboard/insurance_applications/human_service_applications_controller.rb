class Dashboard::InsuranceApplications::HumanServiceApplicationsController < DashboardController
  before_action :authenticate_client!, except: [:new]
  before_action :set_human_service_application, only: [:edit, :update, :show]

  def new
    @title = "New Human Service - Basic Application"
    @human_service_application = HumanApplicationService.create_application(params[:id], current_client)
    if @human_service_application.new_record?
      @form_submit_path = dashboard_insurance_applications_human_service_applications_path
    else
      @form_submit_path = dashboard_insurance_applications_human_service_application_path(@human_service_application)
    end
  end

  def edit
  end

  def show
  end

  def update
    if @human_service_application.update(human_service_params)
      redirect_to dashboard_insurance_applications_path, notice: "Application was updated successfully."
    else
      render :edit
    end
  end

  private

    def set_human_service_application
      @human_service_application = HumanServiceApplication.find(params[:id])
    end

    def human_service_params
      params.require(:human_service_application).permit(ApplicationAttributes.human_service)
    end
end
