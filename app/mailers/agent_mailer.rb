class AgentMailer < ApplicationMailer
  def new_agent_invite(agent_id, token)
    @agent = Agent.find(agent_id)
    @token =  token
    mail(to: @agent.email, subject: "Invitation instructions")
  end

  def existing_agent_invite(agent_id, token)
    @wholesaler = AgentWholesaler.last.wholesaler
    @agent = Agent.find(agent_id)
    mail(to: @agent.email, subject: "Invitation instructions")
  end

   def new_client_invite(client_id, token, assigned_application_id)
    @client = Client.find(client_id)
    @token =  token
    @assigned_application = InsuranceApplication.find_by(id: assigned_application_id)
    mail(to: @client.email, subject: "Invitation instructions")
  end

  def existing_client_invite(client_id, token)
    @client = Client.find(client_id)
    mail(to: @client.email, subject: "Invitation instructions")
  end

  def client_invite_accept(client_id)
    @client = Client.find(client_id)
    mail(to: @client.invited_by_email, subject: "Invitation accepted")
  end

  def client_invite_sent(client_id)
    @client = Client.find(client_id)
    mail(to: @client.invited_by_email, subject: "Invitation sent")
  end
end
