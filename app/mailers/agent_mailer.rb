class AgentMailer < ApplicationMailer
  def new_agent_invite(agent_id, token)
    @agent = Agent.find(agent_id)
    @token =  token
    mail(to: @agent.email, subject: "You've Been Invited to join DataCrest!")
  end

  def existing_agent_invite(agent_id)
    @agent = Agent.find(agent_id)
    mail(to: @agent.email, subject: "You've Been Invited to join DataCrest!")
  end

   def new_client_invite(client_id, token, assigned_application_id)
    @client = Client.find(client_id)
    @token =  token
    @assigned_application = InsuranceApplication.find_by(id: assigned_application_id)
    mail(from: @client.invited_by_email, to: @client.email, subject: "Your Insurance Application")
  end

  def existing_client_invite(client_id, token, assigned_application_id)
    @client = Client.find(client_id)
    @assigned_application = InsuranceApplication.find_by(id: assigned_application_id)
    mail(to: @client.email, subject: "Your Insurance Application")
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
