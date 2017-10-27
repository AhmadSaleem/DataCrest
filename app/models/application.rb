class Application < ApplicationRecord
  has_many :agency_applications

  belongs_to :wholesaler
end
