class Dashboard::WholesalersController < DashboardController
  before_action :authenticate_salesperson!
  before_action :authorize_salesperson
  before_action :set_wholesaler

  def edit
    @title = 'Edit Company'
  end

  def update
    if @wholesaler.update(wholesaler_params)
      redirect_to edit_dashboard_wholesaler_path(@wholesaler), notice: "Company was updated successfully."
    else
      render :edit
    end
  end

  private

    def authorize_salesperson
      redirect_to root_path, alert: 'You are not authorized' unless current_salesperson.company_owner?
    end

    def wholesaler_params
      params.require(:wholesaler).permit(:title, :logo, :website, :address_1, :address_2, :state, :city, :zip_code)
    end

    def set_wholesaler
      @wholesaler = current_salesperson.owned_wholesaler
    end
end
