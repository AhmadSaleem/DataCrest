class PagesController < ApplicationController
  def index
    @templates = Template.all
  end

  def disclaimer
  end

  def copy_right
  end

  def privacy_policy
  end
end
