class Dashboard::CompaniesController < DashboardController
  before_action :authenticate_saleperson, only: [:wholesaler_account]

  def wholesaler_settings
    @company = current_salesperson.owned_wholesaler
    @employees = current_salesperson.owned_wholesaler_salespeople
  end
end
