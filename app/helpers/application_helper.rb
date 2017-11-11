module ApplicationHelper
  def render_datetime(datetime)
    datetime.strftime("%B %d, %Y %H:%M:%S")
  end

  def render_brand_website
    'http://www.mydatacrest.com'
  end

  def render_copyright_text
    ("&copy; <script>document.write(new Date().getFullYear())</script> " + link_to(render_brand_name + ', Inc', render_brand_website).to_s + ' all rights reserved').html_safe
  end

  def current_user
    current_salesperson || current_agent || current_client
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
    (controller_name.in?(['sessions']) && action_name.in?(['new', 'create']))
  end

  def page?
    not dashboard?
  end
end
