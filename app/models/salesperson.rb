class Salesperson < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :owned_wholesaler, class_name: "Wholesaler", foreign_key: :owner_id, inverse_of: :salesperson_owner

  belongs_to :wholesaler
end
