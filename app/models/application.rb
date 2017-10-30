class Application < ApplicationRecord
  belongs_to :template
  belongs_to :client_application, polymorphic: true
end
