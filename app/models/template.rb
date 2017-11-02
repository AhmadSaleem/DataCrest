class Template < ApplicationRecord
  has_many :agency_applications
  has_many :insurance_applications

  belongs_to :wholesaler
end
