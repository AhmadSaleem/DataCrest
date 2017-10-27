class Application < ApplicationRecord
  has_many :jimcor_dwelling_applications
  has_many :agency_applications

  belongs_to :wholesaler
end
