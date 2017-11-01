module ApplicationHelper
  def render_datetime(datetime)
    datetime.strftime("%B %d, %Y %H:%M:%S")
  end
end
