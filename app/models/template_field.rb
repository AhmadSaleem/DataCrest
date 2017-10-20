class TemplateField < ApplicationRecord
  has_many   :application_fields
  belongs_to :application_template
end
