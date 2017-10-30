class Application < ApplicationRecord
  belongs_to :wholesaler
  belongs_to :client_application, polymorphic: true
end
