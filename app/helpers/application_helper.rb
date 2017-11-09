module ApplicationHelper
  def render_datetime(datetime)
    datetime.strftime("%B %d, %Y %H:%M:%S")
  end

  def dashboard?
    controller_path.split('/').first == 'dashboard'
  end
end
