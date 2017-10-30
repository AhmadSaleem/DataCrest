class AgencyApplication < ApplicationRecord
  belongs_to :agency, optional: true
  belongs_to :agent
  belongs_to :template
end
