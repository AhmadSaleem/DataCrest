class Template < ApplicationRecord
  paginates_per 5

  has_many :agency_applications
  has_many :insurance_applications

  belongs_to :wholesaler

  scope :order_latest, -> { order("created_at DESC") }

  def application_model
    class_name.constantize
  end
end
