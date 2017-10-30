class SendClientInvite
  attr_reader :params
  attr_reader :sender
  attr_reader :invitee
  attr_reader :selected_templates

  def initialize(params: nil, sender:, selected_templates: nil)
    @params = params
    @sender = sender
    @selected_templates = selected_templates
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
      AgentMailer.new_client_invite(invitee.id, invitee.raw_invitation_token).deliver_later
      AgentMailer.client_invite_sent(invitee.id).deliver_later
    end

    def existing_client_emails
      AgentMailer.existing_client_invite(invitee.id, invitee.raw_invitation_token).deliver_later
      AgentMailer.client_invite_sent(invitee.id).deliver_later
    end

    def create_applications
      return if selected_templates.blank?
      selected_templates.each do |template_id|
        template = Template.find(template_id)
        client_application = template.class_name.constantize.find_or_create_by(agent: sender, client: invitee)
        template.applications.find_or_create_by(client_application: client_application)
      end
    end
end
