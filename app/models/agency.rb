class Agency < ApplicationRecord
  has_many :agents, dependent: :destroy
  has_many :agency_applications

  belongs_to :owner, class_name: "Agent"

  mount_uploader :logo, LogoUploader

  validates :website, :title, presence: true, on: :update
end
