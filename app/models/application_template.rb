class ApplicationTemplate < ApplicationRecord
  paginates_per 10

  has_many :applications, dependent: :destroy
  has_many :template_fields

  belongs_to :wholesaler

  validates :title, presence: true

  accepts_nested_attributes_for :template_fields, reject_if: :all_blank, allow_destroy: true
end
