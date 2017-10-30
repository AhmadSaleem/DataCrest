class SendAgentInvite
  attr_reader :params
  attr_reader :sender
  attr_reader :invitee
  attr_reader :selected_templates

  def initialize(params: nil, sender:, selected_templates: nil)
    @params = params
    @sender = sender
    @selected_templates = selected_templates
  end

  def new_agent
    return false if Agent.find_by(email: params[:email]).present?
    invite_agent
    new_agent_emails
    assign_templates
    true
  end

  def existing_agent
    @invitee = Agent.find_by(id: params)
    if @invitee.agent_wholesalers.first_or_create(wholesaler: sender.wholesaler)
      existing_agent_emails
      assign_templates
      return true
    end
    false
  end

  private

    def invite_agent
      @invitee = Agent.invite!(params, sender) { |agent| agent.skip_invitation = true }
      invitee.update_attribute(:invitation_sent_at, Time.current)
    end

    def new_agent_emails
      AgentMailer.new_agent_invite(invitee.id, invitee.raw_invitation_token).deliver_later
      CompanyOwnerMailer.agent_invite_sent(invitee).deliver_later
    end

    def existing_agent_emails
      AgentMailer.existing_agent_invite(invitee.id, invitee.raw_invitation_token).deliver_later
      CompanyOwnerMailer.agent_invite_sent(invitee).deliver_later
    end

    def assign_templates
      return if selected_templates.blank?
      selected_templates.each { |template_id|
        @invitee.agency_applications.find_or_create_by(template_id: template_id, agency: @invitee.agency)
      }
    end
end
