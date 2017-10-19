class Agent < ApplicationRecord
  has_one :owned_agency, class_name: "Agency", foreign_key: :owner_id, inverse_of: :owner

  belongs_to :agency, inverse_of: :agents
end
