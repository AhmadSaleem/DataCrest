class Salesperson < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :invitable

  paginates_per 5

  has_one :owned_wholesaler, class_name: "Wholesaler", foreign_key: :owner_id, inverse_of: :owner

  belongs_to :wholesaler, inverse_of: :salespeople

  accepts_nested_attributes_for :owned_wholesaler

  mount_uploader :profile_picture, ProfilePictureUploader

  validates :first_name, :last_name, :email, presence: true
  validates :wholesaler, presence: true, unless: :company_owner?

  before_validation :assign_wholesaler, on: :create
  before_create     :assign_person_wholesaler

  delegate :title, :templates, :agents, :insurance_applications, :address_1, :logo, :city, :state, :zip_code,
            to: :wholesaler, prefix: true
  delegate :salespeople, to: :owned_wholesaler, allow_nil: true, prefix: true

  def company_owner?
    owned_wholesaler.present?
  end

  def full_name
    [first_name, last_name].join(' ')
  end

  def invited_salespeople
    return unless owned_wholesaler_salespeople.present?
    owned_wholesaler_salespeople.joins(:wholesaler).where('wholesalers.owner_id != salespeople.id')
  end

  def accepted_wholesaler_agents
    wholesaler_agents.invitation_accepted
  end

  def status
    return "Pending"  if invitation_accepted_at.blank? && !invitation_sent_at.blank?
    return "Accepted" unless invitation_accepted_at.blank?
  end

  def role
    return "Wholesaler Owner" if company_owner?
    return "Salesperson"
  end

  def incomplete_comapny_info?
    wholesaler_logo.blank? || wholesaler_address_1.blank? || wholesaler_city.blank? || wholesaler_state.blank? || wholesaler_zip_code.blank?
  end

  def search_agents(search_term)
    agents = Agent.joins(:agency).where("agency_code LIKE ? or agent_code LIKE ? or first_name LIKE ? or last_name LIKE ? or email LIKE ?",
                                      "%#{search_term}%", "%#{search_term}%", "%#{search_term}%", "%#{search_term}%", "%#{search_term}%")
    agents.collect{ |agent| { text: agent.full_name, id: agent.id, pic: agent.profile_picture.url } if agent.invitation_accepted_at? || agent.company_owner? }
  end

  private

  def assign_wholesaler
    self.wholesaler = owned_wholesaler if owned_wholesaler.present?
  end

  def assign_person_wholesaler
    return if company_owner? || invited_by.blank?
    self.wholesaler = invited_by.wholesaler
  end
end
