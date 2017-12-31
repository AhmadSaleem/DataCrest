class SendClientInvite
  attr_reader :params
  attr_reader :sender
  attr_reader :invitee
  attr_reader :selected_templates
  attr_reader :assigned_application

  def initialize(params: nil, sender:, selected_templates: nil)
    @params = params
    @sender = sender
    @selected_templates = selected_templates
    @assigned_application = ""
  end

  def new_client
    return false if Client.find_by(email: params[:email]).present?
    invite_client
    create_applications
    new_client_emails
    true
  end

  def existing_client
    @invitee = Client.find_by(id: params)
    if @invitee.present?
      create_applications
      existing_client_emails
      return true
    end
    false
  end

  private

    def invite_client
      @invitee = Client.invite!(params, sender) { |client| client.skip_invitation = true }
      invitee.update_attribute(:invitation_sent_at, Time.current)
    end

    def new_client_emails
      AgentMailer.new_client_invite(invitee.id, invitee.raw_invitation_token, assigned_application).deliver_later
      AgentMailer.client_invite_sent(invitee.id).deliver_later
    end

    def existing_client_emails
      AgentMailer.existing_client_invite(invitee.id, invitee.raw_invitation_token, assigned_application).deliver_later
      AgentMailer.client_invite_sent(invitee.id).deliver_later
    end

    def create_applications
      return if selected_templates.blank?
      selected_templates.each do |template_id|
        template = Template.find(template_id)
        client_application = template.application_model.find_or_create_by(agent: sender, client: invitee)
        application = template.insurance_applications.find_or_create_by(client_application: client_application)
        @assigned_application = application.id
      end
    end
end
