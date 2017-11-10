class WholesalersController < ApplicationController
  def index
    @wholesalers = Wholesaler.all.page(params[:page])
  end

  def show
    @wholesaler = Wholesaler.find_by(id: params[:id])
    @wholesaler_templates = @wholesaler.templates.page(params[:page]) if @wholesaler.present?
  end
end
