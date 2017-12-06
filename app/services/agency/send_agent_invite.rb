class Agency::SendAgentInvite
  attr_reader :params
  attr_reader :sender
  attr_reader :invitee

  def initialize(params: nil, sender:)
    @params = params
    @sender = sender
  end

  def call
    agent = Agent.find_by(email: params[:email])
    return false if agent.present? && (agent.company_owner? || agent.invitation_accepted?)

    invite_agent
    send_emails
    return true
  end

  def resend_invite(id)
    @invitee = Agent.find_by_id(id)
    return false if invitee.blank?

    reinvite_agent
    send_emails
    true
  end

  private

  def invite_agent
    @invitee = Agent.invite!(params, sender) { |sp| sp.skip_invitation = true }
    @invitee.update_attribute(:invitation_sent_at, Time.current)
  end

  def send_emails
    Agency::AgentMailer.invitation_instructions(invitee.id, invitee.raw_invitation_token).deliver_later
    Agency::AgencyMailer.agent_invite_sent(invitee).deliver_later
  end

  def reinvite_agent
    invitee.invite! { |sp| sp.skip_invitation = true }
    invitee.update_attribute(:invitation_sent_at, Time.current)
  end
end
