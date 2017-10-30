class Wholesaler < ApplicationRecord
  has_many :salespeople, dependent: :destroy
  has_many :agent_wholesalers
  has_many :agents, through: :agent_wholesalers
  has_many :applications
  has_many :templates

  mount_uploader :logo, LogoUploader

  belongs_to :owner, class_name: "Salesperson"

  validates :title, presence: true
  validates :website, :state, :address_1, :city, :zip_code, :logo, presence: true, on: :update
end
