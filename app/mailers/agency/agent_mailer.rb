class Agency::AgentMailer < ApplicationMailer
  def invitation_instructions(agent_id, token)
    @agent = Agent.find(agent_id)
    @token =  token
    mail(to: @agent.email, subject: "Invitation instructions")
  end
end
