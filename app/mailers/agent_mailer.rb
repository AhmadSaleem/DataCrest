class AgentMailer < ApplicationMailer
  def new_agent_invite(agent_id, token)
    @agent = Agent.find(agent_id)
    @token =  token
    mail(to: @agent.email, subject: "Invitation instructions")
  end

  def existing_agent_invite(agent_id, token)
    @agent = Agent.find(agent_id)
    mail(to: @agent.email, subject: "Invitation instructions")
  end
end
