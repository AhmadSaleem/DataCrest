module ApplicationHelper
  def render_datetime(datetime)
    datetime.strftime("%B %d, %Y %H:%M:%S")
  end

  def dashboard?
    controller_path.split('/').first == 'dashboard' || edit_profile?
  end

  def edit_profile?
    (controller_name.in?(['registrations']) && action_name.in?(['edit', 'update']))
  end

  def new_registration?
    (controller_name.in?(['registrations']) && action_name.in?(['new', 'create']))
  end

  def new_session?
    (controller_name.in?(['sessions']) && action_name.in?(['new']))
  end

  def page?
    (controller_name.in?(['pages']))
  end
end
