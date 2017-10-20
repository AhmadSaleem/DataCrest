class TemplateField < ApplicationRecord
  has_many   :application_fields
  belongs_to :application_template

  enum field_type: {
    text_field:     1,
    number_field:   2,
    check_box:      3,
    radio_button:   4,
    password_field: 5,
  }
end
