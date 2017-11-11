class Dashboard::TemplatesController < DashboardController
  before_action :set_template

  def show
    @jimcor_dwelling_application = @template.application_model.new if @template.present?
    application_directory = @template.class_name.tableize
    render "dashboard/#{application_directory}/show"
  end

  private

  def set_template
    @template = Template.find(params[:id])
  end
end
