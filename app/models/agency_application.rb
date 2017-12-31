class AgencyApplication < ApplicationRecord
  belongs_to :agency, optional: true
  belongs_to :agent, counter_cache: :applications_count
  belongs_to :template
end
