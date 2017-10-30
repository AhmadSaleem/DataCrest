class Template < ApplicationRecord
  has_many :agency_applications
  has_many :applications

  belongs_to :wholesaler
end
