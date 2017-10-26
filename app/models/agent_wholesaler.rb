class AgentWholesaler < ApplicationRecord
  belongs_to :agent
  belongs_to :wholesaler

  validates :agent, :wholesaler, presence: true

  enum status: { pending: 0 , accepted: 1 }
end
