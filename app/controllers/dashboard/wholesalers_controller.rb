class Dashboard::WholesalersController < ApplicationController
  before_action :authenticate_salesperson!, only: [:edit, :update]
  before_action :authorize_salesperson, only: [:edit, :update]
  before_action :set_wholesaler, only: [:edit, :update]

  def index
    @wholesalers = Wholesaler.all
  end

  def edit
  end

  def update
    if @wholesaler.update(wholesaler_params)
      redirect_to edit_dashboard_wholesaler_path(@wholesaler), notice: "Company was updated successfully."
    else
      render :edit
    end
  end

  def show
    @wholesaler = Wholesaler.find(params[:id])
    @wholesaler_templates = @wholesaler.templates if @wholesaler.present?
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
