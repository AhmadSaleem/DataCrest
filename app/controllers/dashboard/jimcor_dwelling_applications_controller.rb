class Dashboard::JimcorDwellingApplicationsController < ApplicationController
  before_action :authenticate_client!

  def index
    @jimcor_dwelling_applications = current_client.jimcor_dwelling_applications.page(params[:page])
  end
end
