class Dashboard::InsuranceApplications::JimcorDwellingApplicationsController < DashboardController
  before_action :set_jimcor_dwelling_application, only: [:edit, :update, :show]

  def index
    @jimcor_dwelling_applications = current_client.jimcor_dwelling_applications.page(params[:page])
  end

  def show
  end

  def edit
  end

  def new
    @title = 'New Jimcor Dwellings Application'
  end

  def update
    if @jimcor_dwelling_application.update(jimcor_dwelling_params)
      redirect_to dashboard_jimcor_dwelling_applications_path, notice: "Application was updated successfully."
    else
      render :edit
    end
  end

  def create
    template = Template.find_by(id: params[:id])
    if template.present?
      @jimcor_dwelling_application = current_client.jimcor_dwelling_applications.first_or_create
      template.insurance_applications.find_or_create_by(client_application: @jimcor_dwelling_application)
      return redirect_to edit_dashboard_jimcor_dwelling_application_path(@jimcor_dwelling_application)
    end
    redirect_to dashboard_path, alert: "Application wasn't found."
  end

  private

    def set_jimcor_dwelling_application
      @jimcor_dwelling_application = JimcorDwellingApplication.find(params[:id])
    end

    def jimcor_dwelling_params
      params.require(:jimcor_dwelling_application).permit(ApplicationAttributes.jimcor_dwelling)
    end
end