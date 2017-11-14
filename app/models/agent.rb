  class Agent < ApplicationRecord
  paginates_per 5

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

  mount_uploader :profile_picture, ProfilePictureUploader

  belongs_to :agency, inverse_of: :agents

  accepts_nested_attributes_for :owned_agency

  before_validation :assign_agency, on: :create
  before_create     :assign_person_agency

  delegate :full_name, :wholesaler_title, to: :invited_by, prefix: true, allow_nil: true
  delegate :title, :logo, :address_1, :city, :zip_code, :state, to: :agency, prefix: true
  delegate :agency_code, to: :agency

  validates :first_name, :last_name, presence: true
  validates :agency, presence: true, unless: :company_owner?

  def full_name
    "#{first_name} #{last_name}"
  end

  def company_owner?
    owned_agency.present?
  end

  def role
    return "Agency owner" if company_owner?
    return "Agent"
  end

  def incomplete_comapny_info?
    agency_logo.blank? || agency_address_1.blank? || agency_city.blank? || agency_state.blank? || agency_zip_code.blank?
  end

  private
    #call on agency signup
    def assign_agency
      self.agency = owned_agency if owned_agency.present?
    end

    #call on agent invitation
    def assign_person_agency
      return if invited_by.blank?
      self.agency = owned_agency if company_owner? && invited_by.model_name == "Salesperson"
    end
end
