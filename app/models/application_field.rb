class ApplicationField < ApplicationRecord
  belongs_to :application
  belongs_to :template_field
end
