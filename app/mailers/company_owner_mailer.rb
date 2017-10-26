class CompanyOwnerMailer < ApplicationMailer
  def salesperson_invite_sent(resource)
    @invited_by = Salesperson.find(resource.invited_by_id)
    @salesperson = resource
    mail(to: @invited_by.email, subject: "Salesperson invitation")
  end

  def salesperson_invite_accept(resource)
    @salesperson = Salesperson.find(resource.invited_by_id)
    @joined_salesperson = resource
    mail(to: @salesperson.email, subject: "Salesperson invitation success")
  end

  def agent_invite_sent(resource)
    @invited_by = Salesperson.find(resource.invited_by_id)
    @agent = resource
    mail(to: @invited_by.email, subject: "Invitation sent")
  end

  def agent_invite_accept(resource)
    @salesperson = Salesperson.find(resource.invited_by_id)
    @joined_agent = resource
    mail(to: @salesperson.email, subject: "Invitation accepted")
  end
end
