class InsuranceApplication < ApplicationRecord
  belongs_to :template
  belongs_to :client_application, polymorphic: true

  delegate :client_full_name, to: :client_application, allow_nil: true

  enum status: {
    incomplete:   0,
    submitted:    1,
    approved:     2,
    rejected:     3,
  }

  def application_title
    template.title
  end
end