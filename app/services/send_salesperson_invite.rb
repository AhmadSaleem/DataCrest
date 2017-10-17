class SendSalespersonInvite
  attr_reader :params
  attr_reader :sender
  attr_reader :invitee


  def initialize(params: nil, sender:)
    @params = params
    @sender = sender
  end

  def call
    salesperson = Salesperson.find_by(email: params[:email])
    return false if salesperson.present? && (salesperson.company_owner? || salesperson.invitation_accepted?)

    invite_salesperson
    send_emails
    return true
  end

  def resend_invite(id)
    @invitee = Salesperson.find_by_id(id)
    return false if invitee.blank?

    reinvite_salesperson
    send_emails
    true
  end

  private

  def invite_salesperson
    @invitee = Salesperson.invite!(params, sender) { |sp| sp.skip_invitation = true }
    @invitee.update_attribute(:invitation_sent_at, Time.current)
  end

  def send_emails
    SalespersonMailer.invitation_instructions(invitee.id, invitee.raw_invitation_token).deliver_later
    CompanyOwnerMailer.salesperson_invite_sent(invitee).deliver_later
  end

  def reinvite_salesperson
    invitee.invite! { |sp| sp.skip_invitation = true }
    invitee.update_attribute(:invitation_sent_at, Time.current)
  end
end
