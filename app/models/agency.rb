class Agency < ApplicationRecord
  has_many :agents, dependent: :destroy
  has_many :agency_applications

  belongs_to :owner, class_name: "Agent"

  mount_uploader :logo, LogoUploader

  validates :website, :title, presence: true, on: :update

  def company_address
    "#{address_1}<br/> #{city}, #{state} #{zip_code}".html_safe
  end
end
