class ApplicationField < ApplicationRecord
  belongs_to :application
  belongs_to :template_field

  delegate :field, :field_type, :check_box?, :radio_button?, to: :template_field, allow_nil: true
  validates :value, presence: true
end
