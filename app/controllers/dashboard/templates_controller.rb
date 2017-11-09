class Dashboard::TemplatesController < ApplicationController
  before_action :set_template

  def show
    @jimcor_dwelling_application = @template.model_name.new if @template.present?
    application_directory = @template.class_name.tableize
    render "dashboard/#{application_directory}/show"
  end

  private

  def set_template
    @template = Template.find(params[:id])
  end
end
