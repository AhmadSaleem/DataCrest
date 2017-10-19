class Agent < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :owned_agency, class_name: "Agency", foreign_key: :owner_id, inverse_of: :owner

  has_many :agent_wholesalers
  has_many :wholesalers, through: :agent_wholesalers

  belongs_to :agency, inverse_of: :agents
end
