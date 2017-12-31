class AgentWholesaler < ApplicationRecord
  belongs_to :agent
  belongs_to :wholesaler

  validates :agent, :wholesaler, presence: true
  validates :agent, uniqueness: { scope: :wholesaler }

  enum status: { pending: 0 , accepted: 1 }
end
