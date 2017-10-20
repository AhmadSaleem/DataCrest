class ApplicationTemplate < ApplicationRecord
  has_many :applications, dependent: :destroy
  has_many :template_fields

  belongs_to :wholesaler
end
