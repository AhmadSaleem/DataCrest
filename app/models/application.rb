class Application < ApplicationRecord
  has_many :application_fields, dependent: :destroy

  belongs_to :client
  belongs_to :agent
  belongs_to :application_template
end
