class ApplicationTemplate < ApplicationRecord
  has_many :applications, dependent: :destroy

  belongs_to :wholesaler
end
