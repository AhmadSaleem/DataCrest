class InsuranceApplication < ApplicationRecord
  belongs_to :template
  belongs_to :client_application, polymorphic: true

  delegate :client_full_name, :agent, :agent_full_name, :client_email, to: :client_application, allow_nil: true
  delegate :wholesaler_title, to: :template

  enum status: {
    incomplete:   0,
    submitted:    1,
    approved:     2,
    rejected:     3,
  }

  def application_title
    template.title
  end

  def agent_name
    agent.present? ? agent_full_name : "N/A"
  end
end
