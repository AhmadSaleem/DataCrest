class Dashboard::AgenciesController < ApplicationController
  before_action :authenticate_agent!
  before_action :authorize_agent
  before_action :set_agency

  def edit
  end

  def update
    if @agency.update(agency_params)
      redirect_to edit_dashboard_agency_path(@agency), notice: "Company was updated successfully."
    else
      render :edit
    end
  end

  private

    def authorize_agent
      redirect_to root_path, alert: 'You are not authorized' unless current_agent.company_owner?
    end

    def agency_params
      params.require(:agency).permit(:title, :logo, :website, :address_1, :address_2, :state, :city, :zip_code)
    end

    def set_agency
      @agency = current_agent.owned_agency
    end
end
