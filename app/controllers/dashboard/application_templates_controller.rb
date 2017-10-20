class Dashboard::ApplicationTemplatesController < ApplicationController
  before_action :authenticate_salesperson!

  def index
    @application_templates = current_salesperson.application_templates.page(params[:page])
  end

  def new
    @application_template = ApplicationTemplate.new
    @application_template.template_fields.new
  end

  def create
    if current_salesperson.wholesaler.application_templates.create(application_template_params)
      flash[:notice] = "Successfully created."
    else
      flash[:alert] = "Creation failed"
    end
    redirect_to dashboard_application_templates_path
  end

  private

  def application_template_params
    params.require(:application_template).permit(:title, template_fields_attributes: [:id, :field, :field_type])
  end
end
