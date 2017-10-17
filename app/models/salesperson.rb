class Salesperson < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :invitable

  has_one :owned_wholesaler, class_name: "Wholesaler", foreign_key: :owner_id, inverse_of: :owner

  belongs_to :wholesaler, inverse_of: :salespeople

  accepts_nested_attributes_for :owned_wholesaler

  validates :first_name, :last_name, :email, :password, :password_confirmation, presence: true

  before_validation :assign_wholesaler, on: :create

  private

  def assign_wholesaler
    self.wholesaler = owned_wholesaler if owned_wholesaler.present?
  end
end
