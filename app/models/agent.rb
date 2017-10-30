class Agent < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :owned_agency, class_name: "Agency", foreign_key: :owner_id, inverse_of: :owner

  has_many :agent_wholesalers
  has_many :wholesalers, through: :agent_wholesalers
  has_many :jimcor_dwelling_applications
  has_many :clients, through: :jimcor_dwelling_applications
  has_many :agency_applications
  has_many :templates, through: :agency_applications

  belongs_to :agency, inverse_of: :agents

  delegate :full_name, :wholesaler_title, to: :invited_by, prefix: true, allow_nil: true

  validates :first_name, :last_name, presence: true
  validates :agency, presence: true, unless: :company_owner?

  def full_name
    "#{first_name} #{last_name}"
  end

  def company_owner?
    owned_agency.present?
  end
end
