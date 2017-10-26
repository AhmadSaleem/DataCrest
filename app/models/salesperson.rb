class Salesperson < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :invitable

  paginates_per 5

  has_one :owned_wholesaler, class_name: "Wholesaler", foreign_key: :owner_id, inverse_of: :owner

  belongs_to :wholesaler, inverse_of: :salespeople

  accepts_nested_attributes_for :owned_wholesaler

  validates :first_name, :last_name, presence: true
  validates :wholesaler, presence: true, unless: :company_owner?

  before_validation :assign_wholesaler, on: :create
  before_create     :assign_person_wholesaler

  delegate :title, to: :wholesaler, prefix: true
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

  def status
    return "Pending"  if invitation_accepted_at.blank? && !invitation_sent_at.blank?
    return "Accepted" unless invitation_accepted_at.blank?
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
