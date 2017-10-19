class Application < ApplicationRecord
  belongs_to :client
  belongs_to :agent
  belongs_to :application_template
end
