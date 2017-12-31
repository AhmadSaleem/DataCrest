class Agency::AgencyMailer < ApplicationMailer
  def agent_invite_sent(resource)
    @invited_by = Agent.find(resource.invited_by_id)
    @agent = resource
    mail(to: @invited_by.email, subject: "Invitation sent")
  end

  def agent_invite_accept(resource)
    @agent = Agent.find(resource.invited_by_id)
    @joined_agent = resource
    mail(to: @agent.email, subject: "Invitation accepted")
  end
end
