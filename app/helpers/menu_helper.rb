module MenuHelper

  def render_brand_name
    return current_salesperson.wholesaler_title if salesperson_signed_in?
    return current_agent.agency_title if agent_signed_in?
    "DataCrest"
  end

  def render_edit_account_path
    return edit_salesperson_registration_path if salesperson_signed_in?
    return edit_agent_registration_path if agent_signed_in?
    edit_client_registration_path if client_signed_in?
  end

  def render_logout_path
    return destroy_salesperson_session_path if salesperson_signed_in?
    return destroy_agent_session_path if agent_signed_in?
    destroy_client_session_path if client_signed_in?
  end
end
