class Agent < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :owned_agency, class_name: "Agency", foreign_key: :owner_id, inverse_of: :owner
  has_many :applications, dependent: :destroy
  has_many :clients, through: :applications

  belongs_to :agency, inverse_of: :agents
end
