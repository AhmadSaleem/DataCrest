class Client < ApplicationRecord
  paginates_per 5

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :invitable

  has_many :jimcor_dwelling_applications
  has_many :agents, through: :jimcor_dwelling_applications

  delegate :full_name, :email, to: :invited_by, prefix: true, allow_nil: true

  mount_uploader :profile_picture, ProfilePictureUploader

  def full_name
   "#{first_name} #{last_name}"
  end

  def role
    return "Client"
  end
end
