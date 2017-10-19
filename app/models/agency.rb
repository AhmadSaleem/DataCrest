class Agency < ApplicationRecord
  has_many :agents, dependent: :destroy

  belongs_to :owner, class_name: "Agent"
end
