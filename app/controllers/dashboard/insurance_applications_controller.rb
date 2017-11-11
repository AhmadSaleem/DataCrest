class Dashboard::InsuranceApplicationsController < DashboardController
  before_action :authenticate_salesperson!
  before_action :set_insurance_application, only: [:show, :edit, :update]

  def index
    @wholesaler_applications = current_salesperson.wholesaler_insurance_applications.page(params[:page])
  end

  def show
    @jimcor_dwelling_application = @insurance_application.client_application
    render 'dashboard/jimcor_dwelling_applications/show'
  end

  def edit
  end

  def update
    if @insurance_application.update(update_params)
      redirect_to dashboard_insurance_applications_path, notice: "Status was updated successfully."
    else
      render :edit
    end
  end

  private

  def set_insurance_application
    @insurance_application = InsuranceApplication.find(params[:id])
  end

  def update_params
    params.require(:insurance_application).permit(:status)
  end
end
