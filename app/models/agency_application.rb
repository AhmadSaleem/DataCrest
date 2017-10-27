class AgencyApplication < ApplicationRecord
  belongs_to :agency
  belongs_to :agent
  belongs_to :application
end
